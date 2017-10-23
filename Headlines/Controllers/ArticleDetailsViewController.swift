//
//  ArticleDetailsViewController.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsViewController : UIViewController {
    
    var articleDetailViewModel :ArticleDetailViewModel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.articleDetailViewModel.articleViewModel.title
    }
}
