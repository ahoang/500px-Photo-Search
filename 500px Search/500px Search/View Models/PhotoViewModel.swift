//
//  PhotoViewModel.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Foundation

class PhotoViewModel {

    private var photo: Photo
    private let dateFormatter = DateFormatter()

    var name: String? {
        get {
            return photo.name
        }
    }

    var photoDescription: String? {
        get {
            return photo.description
        }
    }

    var camera: String? {
        get {
            return photo.camera
        }
    }

    var focalLength: String? {
        get {
            return photo.focalLength
        }
    }

    var aperture: String? {
        get {
            return photo.aperture
        }
    }

    var viewed: Int? {
        get {
            return photo.viewed
        }
    }

    var rating: Double? {
        get {
            return photo.rating
        }
    }

    var dateTaken: String? {
        get {
            guard let dateTaken = photo.dateTaken else {
                return nil
            }

            return dateFormatter.string(from: dateTaken)
        }
    }

    var url: URL? {
        get {
            return photo.url
        }
    }

    init(photo: Photo) {
        self.photo = photo
    }

}
