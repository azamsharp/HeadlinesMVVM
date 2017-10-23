//
//  Webservice.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    
    func getArticles(url :URL, callback :@escaping ([Article]) -> ()) {
        
        var articles = [Article]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! JSONDictionary
                
                let articleDictionaries = dictionary["articles"] as! [JSONDictionary]
                
                articles = articleDictionaries.flatMap { dictionary in
                    return Article(dictionary :dictionary)
                }
            }
            
            DispatchQueue.main.async {
                callback(articles)
            }
            
        }.resume()
        
    }
    
}
