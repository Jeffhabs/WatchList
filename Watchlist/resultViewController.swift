//
//  resultViewController.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/22/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    var toPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = toPass
    }
    
    
}

