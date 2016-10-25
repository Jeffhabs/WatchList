//
//  ViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/20/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//typealias JSONDictionary = [String: AnyObject]
//typealias JSONArray = [JSONDictionary]

/*
   -- Json isn't requesting on search button
   -- How can I pass this movieArray to my UITableView
 
 */

class ViewController: UIViewController, UITextFieldDelegate {
        
    
    @IBOutlet var searchText: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBAction func searchTextDidChange(_ textField: UITextField)
    {
        if searchText.text != nil || searchText.text != " " {
            searchButton.isEnabled = true
            searchText.text = textField.text
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject)
    {
        searchText.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText.resignFirstResponder()
        return true
    }
    
    @IBAction func sendRequest(_ sender: UIButton) {
        if searchText.text == nil || searchText.text == " " {
            print("Error: Please enter movie to search")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieTitles" {
            let rvc = segue.destination as! resultViewController
            rvc.searchTerm = searchText.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.isEnabled = false
        if searchText.text == nil || searchText.text == " " {
            searchButton.isEnabled = false
        }
    }
    
    
    /* This will reset my text field to blank, and disable my button */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchText.text = " "
        searchButton.isEnabled = false
    }
}
    
    
    



