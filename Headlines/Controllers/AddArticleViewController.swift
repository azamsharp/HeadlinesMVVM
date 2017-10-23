//
//  AddArticleViewController.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class AddArticleViewController : UIViewController {
    
    // For this example assume they are UITextField
    @IBOutlet weak var titleTextField :BindingTextField! {
        didSet {
            titleTextField.bind { self.viewModel.title.value = $0 }
        }
    }
    @IBOutlet weak var descriptionTextField :BindingTextField! {
        didSet {
            descriptionTextField.bind { self.viewModel.description.value = $0 }
        }
    }
    
    var viewModel :AddArticleViewModel! {
       
        didSet {
            viewModel.title.bind = { [unowned self] in self.titleTextField.text = $0 }
            viewModel.description.bind = { [unowned self] in self.descriptionTextField.text = $0 }
        }
    }
    
    @IBAction func AddArticleButtonPressed(_ sender: Any) {
        
        self.viewModel.title.value = "hello world"
        self.viewModel.description.value = "description"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.viewModel = AddArticleViewModel()
    }
    
}
