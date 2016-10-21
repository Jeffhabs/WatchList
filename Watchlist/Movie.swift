//
//  Movie.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/18/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON


class MovieResults: Mappable {
    
    var movieResults: [MovieInfo]?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        // An array of objects
        self.movieResults <- map["results"]
    }
}

class MovieInfo: Mappable {
    
    var movieTitle: String?
    var movieID: Int?
    var movieRating: String?
    var movieReleaseDate: String?
    var inTheaters: Bool?
    
    var movieResults: [MovieInfo]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.movieTitle <- map["title"]
        self.movieID <- map["id"]
        self.movieRating <- map["rating"]
        self.movieReleaseDate <- map["release_date"]
        self.inTheaters <- map["in_theaters"]
    }
}

//class MovieStore {
//    var movieItemArray = [MovieInfo]()
//
//}
 

//class MovieModel: JSONModel {
//    
//    var movieTitle: String?
//    var movieID: Int?
//    var movieRating: String?
//    var movieReleaseDate: String?
//    var inTheaters: Bool?
//    
//    required init?(json: JSONDictionary) {
//        let json = JSON(json)
//        
//        guard let id = json["id"].int, let title = json["title"].string,
//            let rating = json["rating"].string, let rDate = json["release_date"].string,
//            let theaters = json["in_theaters"].bool else {
//                
//             self.movieTitle = ""
//             self.movieID = 0
//             self.movieRating = ""
//             self.movieReleaseDate = ""
//             self.inTheaters = false
//            return nil
//        }
//        
//        self.movieTitle = title
//        self.movieID = id
//        self.movieReleaseDate = rDate
//        self.movieRating = rating
//        self.inTheaters = theaters
//        
//    }
//}


