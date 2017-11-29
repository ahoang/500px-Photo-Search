//
//  ViewController.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Cocoa
import SDWebImage

class ViewController: NSViewController {

    @IBOutlet weak var outlineView: NSOutlineView!

    private var feedViewModel = FeedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedViewModel.reloadViews = { [weak self] in
            self?.outlineView.reloadData()
        }

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func buttonPushed(_ sender: Any) {

    }

    @IBAction func updateSearch(_ sender: NSSearchField) {
        let searchTerm = sender.stringValue
        self.feedViewModel.search(searchTerm)

    }
}

extension ViewController : NSOutlineViewDataSource {

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {

        if let groupViewModel = item as? PhotosGroupViewModel {
            return groupViewModel.photoViewModels.count
        }

        return self.feedViewModel.groupViewModels.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {

        if let groupViewModel = item as? PhotosGroupViewModel {
            return groupViewModel.photoViewModels[index]
        }

        return self.feedViewModel.groupViewModels[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let _ = item as? PhotosGroupViewModel {
            return true
        }

        return false
    }
}

extension ViewController : NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?

        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("PhotoColumn") {
            if let groupViewModel = item as? PhotosGroupViewModel {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("GroupCell"), owner: self) as? NSTableCellView
                view?.textField?.stringValue = groupViewModel.title
            } else if let photoViewModel = item as? PhotoViewModel {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("PhotoCell"), owner: self) as? NSTableCellView
                view?.imageView?.sd_setImage(with: photoViewModel.url, completed: nil)
            }
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier("ShutterColumn"), let photoViewMOdel = item as? PhotoViewModel, let shutterSpeed = photoViewMOdel.shutter {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("ShutterCell"), owner: self) as? NSTableCellView
            view?.textField?.stringValue = shutterSpeed
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier("ISOColumn"), let photoViewModel = item as? PhotoViewModel, let iso = photoViewModel.iso {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("ISOCell"), owner: self) as? NSTableCellView
            view?.textField?.stringValue = iso
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier("ApertureColumn"), let photoViewModel = item as? PhotoViewModel, let aperture = photoViewModel.aperture {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("ApertureCell"), owner: self) as? NSTableCellView
            view?.textField?.stringValue = aperture
        }


        return view
    }

    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        if let _ = item as? PhotoViewModel {
            return 100
        } else {
            return 20
        }
    }
}


