//
//  TopNewsTableViewRouter.swift
//  DelawebTest
//
//  Created by Vladimir on 04.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class TopNewsTableViewRouter: PresenterToRouterTopNewsTableViewProtocol {
  
    
    
    // MARK: Static methods
    static func createModule() -> TopNewsTableViewCell {
        
        let viewController = TopNewsTableViewCell()
        
        let presenter: ViewToPresenterTopNewsTableViewProtocol & InteractorToPresenterTopNewsTableViewProtocol = TopNewsTableViewPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TopNewsTableViewRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TopNewsTableViewInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToArticleDetail(on view: UITableViewController, with article: Article, with image: UIImage) {
          print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
        let articleDetailViewController = ArticleDetailRouter.createModule(with: article, with: image)

        let viewController = view
          viewController.navigationController?
              .pushViewController(articleDetailViewController, animated: true)
    

      }
    
}
