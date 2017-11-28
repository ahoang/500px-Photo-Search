//
//  Photo.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo {

    var id: String?
    var name: String?
    var description: String?
    var camera: String?
    var focalLength: String?
    var iso: String?
    var shutterSpeed: String?
    var aperture: String?
    var viewed: Int?
    var rating: Double?
    var dateTaken: Date?
    var url: URL?

    init(json: JSON) {
        self.id = json["id"].string
        self.name = json["name"].string
        self.description = json["description"].string
        self.camera = json["camera"].string
        self.focalLength = json["focal_length"].string
        self.iso = json["iso"].string
        self.shutterSpeed = json["shutter_speed"].string
        self.aperture = json["aperture"].string
        self.viewed = json["times_viewed"].int
        self.rating = json["rating"].double

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let dateString = json["taken_at"].string {
            self.dateTaken = dateFormatter.date(from: dateString)
        }

        if let images = json["images"].dictionary, let urlString = images["url"]?.string {
            self.url = URL(string: urlString)
        }
    }
}
