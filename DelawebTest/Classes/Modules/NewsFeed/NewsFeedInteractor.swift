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
        NetworkService.shared.loadNews(from: "https://newsapi.org/v2/top-headlines?country=us&apiKey=27ba51434f0f490da809b6a44d74ddb5") { (news) in
            self.news = news
            for i in 0..<news.articles.count{
                self.articles.append(news.articles[i])
            }
            self.presenter!.fetchArticlesSuccess(articles: self.articles)
        }
    }
    
    func loadImages() {
        print("Interactor receives the request from Presenter to load images from the server.")
        NetworkService.shared.loadImages(from: news!) { (image) in
            self.images.append(image)
            if self.images.count == 20{
                print(self.images)
                self.presenter!.fetchImagesSuccess(images: self.images)
            }
        }
    }
    
    func retrieveQuote(at index: Int) {
//         guard let quotes = self.quotes, quotes.indices.contains(index) else {
//            self.presenter?.getQuoteFailure()
//            return
//        }
        self.presenter?.getArticleAndImageSuccess(article: self.articles[index-1], data:self.images[index-1])
    }

    
    
}
