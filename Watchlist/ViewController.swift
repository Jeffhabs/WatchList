//
//  ViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/20/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias JSONDictionary = [String: AnyObject]
typealias JSONArray = [JSONDictionary]

class ViewController: UIViewController {
    

    var idArray = [AnyObject]()
    @IBOutlet var searchText: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBAction func searchTextDidChange(_ textField: UITextField)
    {
        searchText.text = textField.text
    }
    @IBAction func dismissKeyboard(_ sender: AnyObject)
    {
        searchText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
       // let jamBaseAPI = "59btb7tn9wfd4khqcwkpag66"
        let gboxAPI = "tdnFhpEouvaW6BFfhFo1zi9KUooWRF"
        let search = "StarWars"
        let id = 133474
        
        Alamofire.request("http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/search/movie/title/\(search)").responseJSON { response in
            //debugPrint(response)
            
            let json = response.result.value as! JSONDictionary
            if let results = json["results"] as? [AnyObject] {
                for item in results {
                    
                    if let id = item["id"] {
                       //populate an id array?
                    }
                }
                
            }
            
        }
        Alamofire.request("http://api-public.guidebox.com/v1.43/US/\(gboxAPI)/movie/\(id)").responseJSON { response in
            //debugPrint(response)
            
            let json = response.result.value as! JSONDictionary
            if let data = json["release_year"] {
                print (data)
            }
            if let genres = json["genres"] as? [AnyObject] {
                for item in genres {
                    if let title = item["title"] {
                        print(title)
                    }
                }
            }
            if let directors = json["directors"] as? [AnyObject] {
                for item in directors {
                    if let name = item["name"] {
                        print(name)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "searchSegue")
        {
            let src = segue.destination as! resultViewController
            
            src.toPass = searchText.text
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
}

