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
    
    @IBAction func searchTextDidChange(textField: UITextField)
    {
        searchText.text = textField.text
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "searchSegue")
        {
            let src = segue.destinationViewController as! resultViewController
            
            src.toPass = searchText.text
        }
    }
}

