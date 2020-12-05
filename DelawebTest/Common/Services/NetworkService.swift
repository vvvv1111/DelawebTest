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
    
  
    
    func loadNews(from urlString: String, completion: @escaping (News) -> Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            var news: News?
            if data == nil{
                print(response?.description)
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
    
    
    func loadImages(from news: News, completion: @escaping (Data) -> Void){
        for i in 0..<news.articles.count{
            if news.articles[i].urlToImage == nil{
                let data = Data()
                completion(data)
            }else{
                let urlString = news.articles[i].urlToImage!
                guard let url = URL(string: urlString) else {return}
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else {
                        let data = Data()
                        completion(data)
                        return
                    }
                    guard error ==  nil else {return}
                    completion(data)
                }
                .resume()
            }
        }
    }
    
    
    
    private init() {}
}

