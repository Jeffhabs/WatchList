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

class resultViewController: UITableViewController {
    
    var searchTerm: String?
    var movieArray = [MovieModel]()
    var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI(search: searchTerm!)
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = 65
    }
    
    func fetchAPI(search: String) {
        let gboxAPI = "rK5M0dCTUd268hk121BpNpEAxMOmFuNh"
        
        /*
        TODO: If let encodedSearchTerm is nil, alert user that the search is invalid!
        */
        let encodedSearchTerm = searchTerm?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let URL = "http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/search/movie/title/\(encodedSearchTerm!)/fuzzy"
        
        Alamofire.request(URL).responseObject { ( response: DataResponse<MovieResults>) in
            
            let result = response.result.value

            if let movies = result?.movieResults {
                for item in movies {
                    let movie = MovieModel()
                    movie.movieTitle = item.movieTitle
                    movie.movieID = item.movieID
                    movie.movieReleaseDate = item.movieReleaseDate
                    movie.movieRating = item.movieRating
                    movie.inTheaters = item.inTheaters
                    
                    self.movieArray.append(movie)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tablView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.movieArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        //let movieArray = movieTitles.getMovieArray()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewcell", for: indexPath)
        let movieItem = self.movieArray[indexPath.row]
        
        let myYellowColor = UIColor(red: 255, green: 202, blue: 32)
        
        // This will auto-adjust the size of my text to fit
        cell.titleLabel.numberOfLines = 1
        
        cell.titleLabel.text = movieItem.movieTitle
        cell.movieId = movieItem.movieID
        //print(cell.movieId)
        
        //movieItem.movieID
        
        //if cell.ratingLabel.text == "PG"
        if movieItem.movieRating == "PG" {
            
            cell.ratingLabel.textColor = UIColor.green
            
        } else if movieItem.movieRating == "PG-13" {
            
            cell.ratingLabel.textColor = myYellowColor
            
        } else if movieItem.movieRating == "R" {
            
            cell.ratingLabel.textColor = UIColor.red
            
        } else {
            
            cell.ratingLabel.textColor = UIColor.black
        }
        
        cell.ratingLabel.text = movieItem.movieRating
        
        /*
          Set Label bold if In theaters and
          Unknown for realease date if Nil
        */
        
        if(movieItem.inTheaters!) {
            cell.theatersLabel.text = "In Theaters!"
            //cell.theatersLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else {
            cell.theatersLabel.text = "Not in Theaters!"
        }
        
        if movieItem.movieReleaseDate == nil {
            cell.yearLabel.text = "Unknown"
        } else {
            
            cell.yearLabel.text = movieItem.movieReleaseDate
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let cell = self.tableView.cellForRow(at: indexPath) as? MovieCell
            let mdvc = segue.destination as! MovieDetailViewController
            mdvc.movieID = cell?.movieId
        }
    }
}



/* An awesome extension I found online for custom
   UIColors!!
   http://www.codingexplorer.com/create-uicolor-swift/
*/
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

