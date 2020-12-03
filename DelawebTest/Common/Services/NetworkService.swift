//
//  NetworkService.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    
   
    
//    var arrayOfPhotos: [Photo] = []
 
    
    
    func loadNews(completion: @escaping (News) -> Void){
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=27ba51434f0f490da809b6a44d74ddb5"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            var news: News?
            if data == nil{
                completion(news!)
            }
            guard let data = data else {return}
            guard error ==  nil else {return}
            do{
                try news = JSONDecoder().decode(News.self, from: data)
                completion(news!)
            }catch{
                print(error)
            }
        }
        .resume()
    }
    
//    func loadImages(from news: News, completion: @escaping ([Data]) -> Void){
//        var images: [Data] = []
//        for index in 0..<news.articles.count{
//            if news.articles[index].urlToImage != nil{
//                let urlString1 = news.articles[index].urlToImage!
//                guard let url = URL(string: urlString1) else {return}
//                URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    guard let data = data else {return}
//                    images.append(data)
//                    guard error ==  nil else {return}
//                }
//                .resume()
//            }else{
//                let data = Data()
//                images.append(data)
//            }
//        }
//        completion(images)
//    }
    
    func loadImages(from news: News, completion: @escaping ([Data]) -> Void){
        var images: [Data] = []
        for i in 0..<news.articles.count{
            let urlString = news.articles[i].urlToImage!
            guard let url = URL(string: urlString) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {return}
                images.append(data)
                guard error ==  nil else {return}
                completion(images)
            }
            .resume()
        }
//        completion(images)
    }
    
    
    private init() {}
}

