//
//  ArticleDetailPresenter.swift
//  DelawebTest
//
//  Created by Vladimir on 05.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailPresenter: ViewToPresenterArticleDetailProtocol {
    // MARK: Properties
    var view: PresenterToViewArticleDetailProtocol?
    var interactor: PresenterToInteractorArticleDetailProtocol?
    var router: PresenterToRouterArticleDetailProtocol?
    
    var article: Article?
    var articlesImage: UIImage?
    
    func urlTapped() {
        let url = URL(string: article!.url)!
        UIApplication.shared.open(url)
      }
    
}

extension ArticleDetailPresenter: InteractorToPresenterArticleDetailProtocol {
  
    
    
}
