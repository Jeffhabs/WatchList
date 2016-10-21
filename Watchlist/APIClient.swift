//
//  APIClient.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/18/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

//typealias JSONDictionary = [String: AnyObject]
//typealias JSONArray = [JSONDictionary]

class APIClient {
    /*
    typealias completionBlock = (_ error: NSError?) -> Void
    
    func getSomeData(searchItem: String, completion: completionBlock) {
        
        let gboxAPI = "rK5M0dCTUd268hk121BpNpEAxMOmFuNh"

        let URL = "http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/search/movie/title/\(searchItem)/fuzzy"
        
        Alamofire.request(URL).responseJSON { response in
            
            let json = response.result.value as! JSONDictionary
            let resultArray = json["results"] as! JSONArray
            
            var results = [MovieModel]()
            
            for item in resultArray {
                if let movieInfo = MovieModel(json: item) {
                    results.append(movieInfo)
                }
            }
            
            let mappedArray: [MovieModel] = mapArray(array: resultArray)
            print(mappedArray)
        }
    }
    */
}
