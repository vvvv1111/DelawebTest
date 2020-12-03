//
//  NewsFeedViewController.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class NewsFeedViewController: UITableViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterNewsFeedProtocol?
    
    //MARK: - TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
       

//        cell.textLabel?.text = presenter?.textLabelText(indexPath: indexPath)
        cell.articleTitle.text = "dfdf"
        cell.articleTitle.text = presenter?.textLabelText(indexPath: indexPath)
        cell.articleDescription.text = presenter?.textDescriptionText(indexPath: indexPath)
        cell.articleImage.image = presenter?.imageArticles(indexPath: indexPath)
        return cell
    }
    
}

extension NewsFeedViewController: PresenterToViewNewsFeedProtocol{
    func onFetchImagesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchArticlesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}



