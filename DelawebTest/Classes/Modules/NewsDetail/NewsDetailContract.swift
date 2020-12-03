//
//  NewsDetailContract.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewsDetailProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewsDetailProtocol {
    
    var view: PresenterToViewNewsDetailProtocol? { get set }
    var interactor: PresenterToInteractorNewsDetailProtocol? { get set }
    var router: PresenterToRouterNewsDetailProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsDetailProtocol {
    
    var presenter: InteractorToPresenterNewsDetailProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsDetailProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewsDetailProtocol {
    
}
