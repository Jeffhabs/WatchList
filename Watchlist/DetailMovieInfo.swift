//
//  DetailMovieInfo.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/22/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper


class DetailMovieInfo: Mappable {
    
    var genreArray: [GenreArray]?
    var writersArray: [WritersArray]?
    var directorArray: [DirectorsArray]?
    var release_year: Int?
    var overview: String?
    var posterImage: String?
    
    /* Update to get purchase/subscription sources */
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.genreArray <- map["genres"]
        self.writersArray <- map["writers"]
        self.directorArray <- map["directors"]
        self.release_year <- map["release_year"]
        self.overview <- map["overview"]
        self.posterImage <- map["poster_120x171"]
    }
}

/* Make a class for each of  the arrays? */

class GenreArray: Mappable {
    
    var genreTitle: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.genreTitle <- map["title"]
    }
}

//class GenreModel: NSObject {
//    
//    var genreTitle: String?
//    
//}

class WritersArray: Mappable {
    
    var writerName: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.writerName <- map["name"]
    }
}

class DirectorsArray: Mappable {
    
    var directorName: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.directorName <- map["name"]
    }
}

class DetailMovieModel: NSObject {
    
    var genreArray: [AnyObject]?
    var writersArray: [AnyObject]?
    var directorArray: [AnyObject]?
    var release_year: Int?
    var overview: String?
    var posterImage: String?

}
