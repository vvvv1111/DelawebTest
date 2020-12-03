//
//  NewsDetailPresenter.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation

class NewsDetailPresenter: ViewToPresenterNewsDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewNewsDetailProtocol?
    var interactor: PresenterToInteractorNewsDetailProtocol?
    var router: PresenterToRouterNewsDetailProtocol?
}

extension NewsDetailPresenter: InteractorToPresenterNewsDetailProtocol {
    
}
