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

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let service = PhotosService()
        service.searchPhotos(searchTerm) { (photos, _) in
            if let photo = photos?.first {
                self.imageView.sd_setImage(with: photo.url, completed: nil)
            }
        }
    }

}



