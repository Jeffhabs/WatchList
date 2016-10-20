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


