//
//  APIClient.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/18/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class APIClient {
    
    func fetchAPI(search: String) -> MovieResults{
        
        var returnResults: MovieResults?
        let gboxAPI = "tdnFhpEouvaW6BFfhFo1zi9KUooWRF"
        let URL = "http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/search/movie/title/Gladiator/fuzzy"
        Alamofire.request(URL).responseObject { ( response: DataResponse<MovieResults>) in
            
            let result = response.result.value
            
            returnResults = result
            
//            if let movies = result?.movie {
//                for item in movies {
//                    print(item.movieTitle)
//                }
//            }
        }
        return returnResults!
    }
    
}
