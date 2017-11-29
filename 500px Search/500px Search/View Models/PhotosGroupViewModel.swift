//
//  PhotosViewModel.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Foundation

class PhotosGroupViewModel {

    private var photos: [Photo]
    var photoViewModels = [PhotoViewModel]()
    var title: String

    init(photos: [Photo], title: String) {
        self.photos = photos
        self.title = title
        self.photoViewModels = self.photos.map({ PhotoViewModel(photo: $0) })

    }
    
}
