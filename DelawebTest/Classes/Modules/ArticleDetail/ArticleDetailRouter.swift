//
//  ArticleDetailRouter.swift
//  DelawebTest
//
//  Created by Vladimir on 05.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailRouter: PresenterToRouterArticleDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with article: Article, with image: UIImage) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        
//        let viewController = ArticleDetailViewController()
        
        let presenter: ViewToPresenterArticleDetailProtocol & InteractorToPresenterArticleDetailProtocol = ArticleDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ArticleDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ArticleDetailInteractor()
//        viewController.presenter?.interactor?.article = article
        viewController.presenter?.article = article
        viewController.presenter?.articlesImage = image

        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
