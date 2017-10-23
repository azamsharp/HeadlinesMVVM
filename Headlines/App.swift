//
//  App.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class App {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController :UINavigationController
    
    init(window :UIWindow) {
        
        navigationController = window.rootViewController as! UINavigationController
        
        guard let articleListTVC = navigationController.viewControllers.first as? ArticleListTableViewController else {
            fatalError("ArticleListTableViewController does not exist")
        }
        
        articleListTVC.didSelect = showArticleDetails
        articleListTVC.addArticleTapped = showAddArticle
        
    }
    
    private func showAddArticle() {
        
        let addArticleNC = storyboard.instantiateViewController(withIdentifier: "AddArticleNavigationController") as! UINavigationController
        
        navigationController.present(addArticleNC, animated: true, completion: nil)
    }
    
    private func showArticleDetails(articleViewModel :ArticleViewModel) {
        
        let articleDetailVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        
        articleDetailVC.articleDetailViewModel = ArticleDetailViewModel(articleViewModel: articleViewModel)
        
        navigationController.pushViewController(articleDetailVC, animated: true)
    }
    
}





