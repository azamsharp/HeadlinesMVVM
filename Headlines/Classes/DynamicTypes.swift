//
//  DynamicTypes.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}


