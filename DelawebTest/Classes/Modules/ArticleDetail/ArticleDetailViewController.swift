//
//  ArticleDetailViewController.swift
//  DelawebTest
//
//  Created by Vladimir on 05.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterArticleDetailProtocol?
    
    @IBOutlet weak var urlButtonLabel: UIButton!
    @IBOutlet weak var articlesImage: UIImageView!
    @IBOutlet weak var articlesDescription: UILabel!
    @IBOutlet weak var articlesTitle: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        articlesImage.image = presenter?.articlesImage
        articlesTitle.text = presenter?.article?.articleDescription
        articlesDescription.text =  presenter?.article?.title
//        urlButtonLabel.setTitle(presenter?.article?.url, for: .normal)
        urlButtonLabel.setTitle("url", for: .normal)

    }

   
    @IBAction func urlButton(_ sender: Any) {
        presenter?.urlTapped()
    }
    
}

extension ArticleDetailViewController: PresenterToViewArticleDetailProtocol{
    // TODO: Implement View Output Methods
}
