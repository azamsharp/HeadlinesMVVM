//
//  AddArticleViewModel.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

struct AddArticleViewModel {
    
    var title :Dynamic<String> = Dynamic("")
    var description :Dynamic<String> = Dynamic("")
}

extension AddArticleViewModel {
    
    init(article :Article) {
        self.title = Dynamic<String>(article.title)
        self.description = Dynamic<String>(article.description)
    }
    
}
