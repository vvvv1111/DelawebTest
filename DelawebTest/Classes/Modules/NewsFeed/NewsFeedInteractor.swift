//
//  NewsFeedInteractor.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation

class NewsFeedInteractor: PresenterToInteractorNewsFeedProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterNewsFeedProtocol?
    
    var articles: [Article] = []
    var news: News?
    var images: [Data] = []
    
    func loadArticles() {
        print("Interactor receives the request from Presenter to load articles from the server.")
        NetworkService.shared.loadNews { (news) in
            self.news = news
            for i in 0..<news.articles.count{
                self.articles.append(news.articles[i])
            }
            self.presenter!.fetchArticlesSuccess(articles: self.articles)
        }
    }
    
    func loadImages() {
        print("Interactor receives the request from Presenter to load images from the server.")
        NetworkService.shared.loadImages(from: news!) { (images) in
            self.images = images
            if images.count == 20{
                self.presenter!.fetchImagesSuccess(images: self.images)
            }
        }
    }

    
    
}
