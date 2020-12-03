//
//  NewsFeedPresenter.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedPresenter: ViewToPresenterNewsFeedProtocol {

    // MARK: Properties
    var view: PresenterToViewNewsFeedProtocol?
    var interactor: PresenterToInteractorNewsFeedProtocol?
    var router: PresenterToRouterNewsFeedProtocol?
    
    var articles: [Article] = []
    var images: [UIImage] = []
    
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.loadArticles()
       
    }
    
    
//     func refresh() {
//         print("Presenter is being notified that the View was refreshed.")
//         interactor?.loadArticles()
//     }
     
    func numberOfRowsInSection() -> Int {
        if articles.count == 0{
            return 0
        }
        return articles.count
    }
     
     func textLabelText(indexPath: IndexPath) -> String? {
         if articles.count == 0{
             return nil
         }
        return articles[indexPath.row].title
     }
    
    func textDescriptionText(indexPath: IndexPath) -> String? {
            if articles.count == 0{
                return nil
            }
           return articles[indexPath.row].articleDescription
        }
    
    func imageArticles(indexPath: IndexPath) -> UIImage? {
        if images.count == 0{
            return nil
        }
        return images[indexPath.row]
    }
    

//     func didSelectRowAt(index: Int) {
//         interactor?.retrieveQuote(at: index)
//     }
//
//     func deselectRowAt(index: Int) {
//         view?.deselectRowAt(row: index)
//     }
}

extension NewsFeedPresenter: InteractorToPresenterNewsFeedProtocol {
    func fetchArticlesSuccess(articles: [Article]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.articles = articles
        view?.onFetchArticlesSuccess()
        interactor?.loadImages()
    }
    
    func fetchImagesSuccess(images: [Data]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        print(images)
        for index in 0..<images.count{
            self.images.append(UIImage(data: images[index])!)

//            if images[index] != nil{
//                self.images.append(UIImage(data: images[index])!)
//            }else{
//                let image = UIImage()
//                self.images.append(image)
//            }
        }
        view?.onFetchImagesSuccess()
    }
    
//    func fetchArticlesFailure(errorCode: Int) {
//        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.onFetchArticlesFailure(error: "Couldn't fetch articles: \(errorCode)")
//    }
    
//    func getArticleSuccess(_ article: Article) {
//        router?.pushToArticleDetail(on: view!, with: article)
//    }
    
//    func getArticleFailure() {
//        print("Couldn't retrieve article by index")
//    }
}
