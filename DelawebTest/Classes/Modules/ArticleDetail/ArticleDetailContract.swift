//
//  ArticleDetailContract.swift
//  DelawebTest
//
//  Created by Vladimir on 05.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticleDetailProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticleDetailProtocol {
    var view: PresenterToViewArticleDetailProtocol? { get set }
    var interactor: PresenterToInteractorArticleDetailProtocol? { get set }
    var router: PresenterToRouterArticleDetailProtocol? { get set }
    var article: Article? { get set }
    var articlesImage: UIImage? { get set }
    
    func urlTapped()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticleDetailProtocol {
    var presenter: InteractorToPresenterArticleDetailProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticleDetailProtocol {
  
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticleDetailProtocol {
    
}
