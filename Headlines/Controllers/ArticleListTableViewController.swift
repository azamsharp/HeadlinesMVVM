//
//  ArticleListTableViewController.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class ArticleListTableViewController : UITableViewController {
    
    private var viewModel :ArticleListViewModel = ArticleListViewModel()  {
        
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var didSelect: (ArticleViewModel) -> () = { _ in }
    var addArticleTapped: () -> () = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.viewModel.title
        
        loadArticles()
    }
    
    private func loadArticles() {
        
        // this url should be part of the URL builder scheme and not right inside the
        // view controller but right now we are focused on MVVM
        let url = URL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=0cf790498275413a9247f8b94b3843fd")!
        
        // this web service should use generic types. Again this is not part of the implementation
        // as we are focusing on MVVM model
        Webservice().getArticles(url: url) { articles in
            print(articles)
            
            let articles = articles.map { article in
                return ArticleViewModel(article :article)
            }
            
            self.viewModel = ArticleListViewModel(articles :articles)
            
        }
    }
 
    @IBAction func addArticleButtonTapped(_ sender: Any) {
        
        addArticleTapped() 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleViewModel = self.viewModel.articles[indexPath.row]
        didSelect(articleViewModel)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let articleViewModel = self.viewModel.articles[indexPath.row]
        
        cell.textLabel?.text = articleViewModel.title
        return cell 
    }
}










