//
//  MovieCell.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 10/21/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var theatersLabel: UILabel!
    
    var movieId: Int!
    
}
