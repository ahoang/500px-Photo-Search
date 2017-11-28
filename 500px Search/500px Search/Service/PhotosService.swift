//
//  500pxService.swift
//  500px Search
//
//  Created by Anthony Hoang on 11/28/17.
//  Copyright © 2017 Anthony Hoang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PhotosService {

    func searchPhotos(_ term: String, completion: @escaping (_ photos: [Photo]?, _ error: Error?) -> Void) {
        let endpoint = "photos/search"

        Alamofire.request(Constants.BaseURL + endpoint, method: .get, parameters: ["term" : term, "consumer_key" : Constants.ConsumerKey, "image_size" : "1080"], encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

            if let result = response.result.value {
                let json = JSON(result)
                let photos = json["photos"].array?.map({ Photo(json: $0) })
                completion(photos, nil)
            }
        }
    }
}

extension PhotosService {
    private enum Constants {
        static let ConsumerKey = "xHkW9aeTnoYk4k1lUYicCjbKY9VXjYOWxE3OsBt8"
        static let BaseURL = "https://api.500px.com/v1/"
    }
}
