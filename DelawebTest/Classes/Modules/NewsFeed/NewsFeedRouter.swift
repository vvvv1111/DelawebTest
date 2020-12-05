//
//  NewsFeedRouter.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedRouter: PresenterToRouterNewsFeedProtocol {

    

    
  
    

    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = NewsFeedViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterNewsFeedProtocol & InteractorToPresenterNewsFeedProtocol = NewsFeedPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewsFeedRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewsFeedInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToArticleDetail(on view: PresenterToViewNewsFeedProtocol, with article: Article, with image: UIImage) {
          print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
        let articleDetailViewController = ArticleDetailRouter.createModule(with: article, with: image)

          let viewController = view as! NewsFeedViewController
          viewController.navigationController?
              .pushViewController(articleDetailViewController, animated: true)

      }
    
 
    
}
