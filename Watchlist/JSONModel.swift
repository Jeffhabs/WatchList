//
//  JSONModel.swift
//  Watchlist
//
//  Created by Jeffrey Haberle on 9/26/16.
//  Copyright © 2016 CS3020. All rights reserved.
//


import Foundation

//This protocol simple says that an object can be created out of a JSONDictionary and that if it can't
//(i.e. required keys are missing from the hash) then it returns nil.  This is an example of a failable initializer.
//see https://developer.apple.com/swift/blog/?id=17

protocol JSONModel {
    init?(json: JSONDictionary)
}


//This is a deep dive into a topic known as generics (similar but not equal to templates in C++)
//This function will take an JSON array and map it into an array of any object we want, provided the object
//conforms to the JSONModel protol.  That is the main reason for declaring the protocol.

//this signature says: There is a function called mapArray, and it operates on some generic type (or class if you prefer), T,
//where T conforms to the JSONModel protocol.  It then returns an array of type T.  So since our TweetModel conforms to JSONModel
//Then it will satisfy the generic type T.  'T' is chosen at random and it's common in generic code to see T used as the generic type,
//Just like in algebra it's common to see variables name X and Y.  If there are two generic types the other common letter is 'U'.
//The protocol really provides us a guarantee that the initializer, T(json: JSONObject) is provided so we can call the method.
//Other than the generic code this function is exactly the same as what is in APIClient.swift.
func mapArray<T: JSONModel>(array: JSONArray) -> [T] {
    
    var results = [T]()
    for hash in array {
        if let object = T(json: hash) {
            results.append(object)
        }
    }
    return results
}
