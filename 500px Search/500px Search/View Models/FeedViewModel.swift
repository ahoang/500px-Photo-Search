//
//  FeedViewModel.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Foundation

class FeedViewModel {

    var reloadViews: (() -> Void)?

    var groupViewModels = [PhotosGroupViewModel]()

    func search(_ term: String) {
        let service = PhotosService()
        service.searchPhotos(term) { [weak self] (photos, _) in
            guard let photos = photos else {
                return
            }

            self?.groupViewModels.append(PhotosGroupViewModel(photos: photos, title: term))
            self?.reloadViews?()
        }
    }
}
