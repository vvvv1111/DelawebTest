//
//  NewsFeedContract.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewsFeedProtocol {
    func onFetchArticlesSuccess()
    func onFetchImagesSuccess()
    var activityIndicator: LoadMoreActivityIndicator! { get set }

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewsFeedProtocol {
    
    var view: PresenterToViewNewsFeedProtocol? { get set }
    var interactor: PresenterToInteractorNewsFeedProtocol? { get set }
    var router: PresenterToRouterNewsFeedProtocol? { get set }
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textDescriptionText(indexPath: IndexPath) -> String?
    func imageArticles(indexPath: IndexPath) -> UIImage?
    func didSelectRowAt(index: Int)
    func scrollViewDidScroll()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsFeedProtocol {
    
    var presenter: InteractorToPresenterNewsFeedProtocol? { get set }
    
    func loadArticles()
    func loadImages()
    func retrieveArticle(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsFeedProtocol {
    func fetchArticlesSuccess(articles: [Article])
    func fetchImagesSuccess(images: [Data])
    func getArticleAndImageSuccess(article:Article, data:Data)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewsFeedProtocol {
    static func createModule() -> UINavigationController
    func pushToArticleDetail(on view: PresenterToViewNewsFeedProtocol, with: Article, with image: UIImage)
}
