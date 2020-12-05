//
//  TopNewsTableViewContract.swift
//  DelawebTest
//
//  Created by Vladimir on 04.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewTopNewsTableViewProtocol {
   func onFetchArticlesSuccess()
   func onFetchImagesSuccess()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTopNewsTableViewProtocol {
    
    var view: PresenterToViewTopNewsTableViewProtocol? { get set }
    var interactor: PresenterToInteractorTopNewsTableViewProtocol? { get set }
    var router: PresenterToRouterTopNewsTableViewProtocol? { get set }
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textDescriptionText(indexPath: IndexPath) -> String?
    func imageArticles(indexPath: IndexPath) -> UIImage?
    
    func didSelectCellAt(index: Int, on view:UITableViewController)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTopNewsTableViewProtocol {
    
    var presenter: InteractorToPresenterTopNewsTableViewProtocol? { get set }
    
    
    func loadArticles()
    func loadImages()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterTopNewsTableViewProtocol {
    func fetchArticlesSuccess(articles: [Article])
       func fetchImagesSuccess(images: [Data])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTopNewsTableViewProtocol {
    static func createModule() -> TopNewsTableViewCell
    func pushToArticleDetail(on view: UITableViewController, with article: Article, with image: UIImage)
}
