//
//  NewsDetailRouter.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailRouter: PresenterToRouterNewsDetailProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = NewsDetailViewController()
        let presenter: ViewToPresenterNewsDetailProtocol & InteractorToPresenterNewsDetailProtocol = NewsDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewsDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewsDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
