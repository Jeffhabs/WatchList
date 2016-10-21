//
//  resultViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/22/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

typealias JSONDictionary = [String: AnyObject]
typealias JSONArray = [JSONDictionary]
typealias completionBlock = (_ error: NSError?) -> Void

class ResultViewController: UITableViewController {
    
    var searchTerm: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI(search: searchTerm!)
        
//        let client = APIClient()
//        client.getSomeData(searchItem: searchTerm!, completion: {(error) -> Void in
//        })
    }
    
    func fetchAPI(search: String) {
        let gboxAPI = "rK5M0dCTUd268hk121BpNpEAxMOmFuNh"
        
        let URL = "http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/search/movie/title/\(searchTerm!)/fuzzy"
        
        Alamofire.request(URL).responseObject { ( response: DataResponse<MovieResults>) in
            
            let result = response.result.value
            var movieArray = [MovieInfo]()

            if let movies = result?.movieResults {
                for item in movies {
                    movieArray.append(item)
                    //print(item.movieTitle)
                }
            }
        }
        
        /* This doesn't print anything
            for some reason my array isn't truly being 
            popluated in the above fetchAPI call
        */
        
//        for item in movieArray {
//            print(item.movieTitle)
//        }
//
//    }
//    override func tableView(_ tablView: UITableView,
//                            numberOfRowsInSection section: Int) -> Int {
//        return movieArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
//    
//        //let movieArray = movieTitles.getMovieArray()
//        let movieItem = movieArray[indexPath.row]
//    
//        cell.textLabel?.text = movieItem.movieTitle
//        cell.detailTextLabel?.text = movieItem.movieRating
//    
//        return cell
//    
//        }
    }
}
