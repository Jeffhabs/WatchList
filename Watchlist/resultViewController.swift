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
    @IBOutlet var backButton: UIButton!
    
    var toPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = toPass
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
    }
}

