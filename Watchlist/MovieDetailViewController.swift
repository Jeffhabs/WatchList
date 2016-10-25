//
//  MovieDetailViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/22/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class MovieDetailViewController: UIViewController {
    
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    /* What if there is less than 3 labels or more? */
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movieID: Int!
    var urlString: String!
    
    var detailArray = [DetailMovieModel]()
    var genreTitles = [Genre]()
    var writerNames = [Writers]()
    var directorNames = [Directors]()
    
    var movie: DetailMovieModel!
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAPI(id: movieID)
        
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        for _ in self.directorNames {
            
            var directors = [String]()
            for name in self.directorNames {
                if let t = name.directorName {
                    directors.append(t)
                }
            }
            directorLabel.text = directors.joined(separator: ", ")
        }
        
        /* What if there is less than 3 labels or more? */
        for _ in self.genreTitles {
            
            var genres = [String]()
            for genre in self.genreTitles {
                if let t = genre.genreTitle {
                    genres.append(t)
                }
            }
            genreLabel.text = genres.joined(separator: ", ")
        }
        
        for _ in self.writerNames {
            
            var writers = [String]()
            for name in self.writerNames {
                if let t = name.writerName{
                    writers.append(t)
                }
            }
            writerLabel.text = writers.joined(separator: ", ")
        }
        
        for item in self.detailArray {
            
            dateLabel.text = "\(item.release_year!)"
            overviewLabel.text = item.overview
            overviewLabel.numberOfLines = 0
            
            if let t = item.posterImage {
                self.urlString = item.posterImage!
                fetchImage(urlString: self.urlString)
            }
            
        }
    }

       

    func fetchAPI(id: Int) {
        let gboxAPI = "rK5M0dCTUd268hk121BpNpEAxMOmFuNh"
        let URL = "http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/movie/\(id)"
        
        Alamofire.request(URL).responseObject { ( response: DataResponse<DetailMovieInfo>) in
            
            let detailMovie = DetailMovieModel()
            let result = response.result.value
            
            if let result = response.result.value {
                
                detailMovie.release_year = result.release_year
                detailMovie.posterImage = result.posterImage
                detailMovie.overview = result.overview

                self.detailArray.append(detailMovie)
                
            }

            if let directors = result?.directorArray {
                for names in directors {
                    self.directorNames.append(names)
                }
            }
            
            if let writers = result?.writersArray {
                for names in writers {
                    self.writerNames.append(names)
                }
            }
            
            if let genres = result?.genreArray {
                for titles in genres {
                    self.genreTitles.append(titles)
                }
            }
            
            self.viewDidLoad()
        }
    }
    
    func fetchImage(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed to fetch image:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid HTTPUrlResponse or statusCode")
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }.resume()
    }
}
