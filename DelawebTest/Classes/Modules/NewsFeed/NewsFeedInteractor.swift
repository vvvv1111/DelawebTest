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
    
    var numberOfPage = 1
    
    //http://newsapi.org/v2/everything?q=world&page=2&sortBy=publishedAt&apiKey=27ba51434f0f490da809b6a44d74ddb5
    
    func loadArticles() {
        print("Interactor receives the request from Presenter to load articles from the server.")
        NetworkService.shared.loadNews(from: "http://newsapi.org/v2/everything?q=world&page=\(numberOfPage)&sortBy=publishedAt&apiKey=7a0e8be631e24659b15af7cbb7d7751d") { (news) in
            self.news = news
            for i in 0..<news.articles.count{
                self.articles.append(news.articles[i])
            }
            self.presenter!.fetchArticlesSuccess(articles: self.articles)
            self.numberOfPage += 1
        }
    }
    
    func loadImages() {
        print("Interactor receives the request from Presenter to load images from the server.")
        NetworkService.shared.loadImages(from: news!) { (image) in
            self.images.append(image)
            if self.images.count == self.articles.count{
                print(self.images)
                self.presenter!.fetchImagesSuccess(images: self.images)
            }
        }
    }
    
    func retrieveArticle(at index: Int) {
//         guard let quotes = self.quotes, quotes.indices.contains(index) else {
//            self.presenter?.getQuoteFailure()
//            return
//        }
        self.presenter?.getArticleAndImageSuccess(article: self.articles[index-1], data:self.images[index-1])
    }

    
    
}
