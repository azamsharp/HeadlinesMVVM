//
//  ArticleListViewModel.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation


struct ArticleListViewModel {
    
    var title :String? = "Articles"
    var articles :[ArticleViewModel] = [ArticleViewModel]()
}

extension ArticleListViewModel {
    
    init(articles :[ArticleViewModel]) {
        self.articles = articles
    }
    
}

struct ArticleViewModel {
    
    var title :String
    var description :String
}

extension ArticleViewModel {
    
    init(article :Article) {
        self.title = article.title
        self.description = article.description
    }
}
