//
//  Show.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/20/16.
//  Copyright © 2016 CS3020. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class Show {
    var category: String
    var name: String
    
    init(category: String, name: String) {
        self.category = category;
        self.name = name;
    }
    
}
