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
    @IBOutlet var genreLabel: UILabel!
    
    var movieID: Int!
    
    var detailArray = [DetailMovieModel]()
    
    var genreTitles = [GenreArray]()
    var writerNames = [WritersArray]()
    var direcorNames = [DirectorsArray]()
    
    var movie: DetailMovieModel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAPI(id: movieID)
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        //where do I set my label text?
        for name in self.direcorNames {
            directorLabel.text = name.directorName
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
                /* The arrays */
//                detailMovie.genreArray = result.genreArray
//                detailMovie.writersArray = result.writersArray
//                detailMovie.directorArray = result.directorArray
                self.detailArray.append(detailMovie)
                
            }
            
            // The below print statements are working as intended
            // So I append to my arrays
            
            if let directors = result?.directorArray {
                for names in directors {
                    print(names.directorName)
                    self.direcorNames.append(names)
                }
            }
            
            if let writers = result?.writersArray {
                for names in writers {
                    print(names.writerName)
                    self.writerNames.append(names)
                }
            }
            
            
            if let genres = result?.genreArray {
                for titles in genres {
                    print(titles.genreTitle)
                    self.genreTitles.append(titles)
                }
            }

        }
        // Not sure if i need to call this here?
        self.viewDidLoad()
    }

}
