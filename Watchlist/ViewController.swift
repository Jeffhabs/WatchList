//
//  ViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/20/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "searchSegue")
        {
            let src = segue.destination as! resultViewController
            
            src.toPass = searchText.text
        }
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
    }
}

