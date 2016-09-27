//
//  resultViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/22/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class resultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var releaseYear: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    @IBAction func backButtonPressed(_sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindHome", sender: self)
    }
    
   
    
    var toPass:String!
    var toDirector:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        resultLabel.text = toPass
        let gboxAPI = "tdnFhpEouvaW6BFfhFo1zi9KUooWRF"
        //let search = "StarWars"
        let id = 133474
        
        Alamofire.request("http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/movie/\(id)").responseJSON { response in
            //debugPrint(response)
            
            let json = response.result.value as! JSONDictionary
            if let data = json["release_year"] {
                self.releaseYear.text = data as? String
                
            if let genres = json["genres"] as? [AnyObject] {
                for item in genres {
                    if let title = item["title"] {
                        self.genreLabel.text = title as? String
                    }
                }
            }
            if let directors = json["directors"] as? [AnyObject]{
                for item in directors {
                    if let name = item["name"]{
                        self.directorLabel.text = name as? String
                    }
                }
            }
            if let purchase_web = json["purchase_web_sources"] as? [AnyObject] {
                for item in purchase_web {
                    if let source = item["display_name"] {
                        print(source)
                    }
                }
            }
        }
        
        
    }
    
    func parse(json: JSON)
    {
        for result in json["genres"].arrayValue {
            let title = result["title"].stringValue
            directorLabel.text = title
            
        }
    }
  }
}
