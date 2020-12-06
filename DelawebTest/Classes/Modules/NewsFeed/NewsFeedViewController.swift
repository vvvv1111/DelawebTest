//
//  NewsFeedViewController.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class NewsFeedViewController: UITableViewController {
    var activityIndicator: LoadMoreActivityIndicator!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        
        let nib2 = UINib(nibName: "TopNewsTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "TopNewsTableViewCell")
        
        activityIndicator = LoadMoreActivityIndicator(scrollView: tableView, spacingFromLastCell: 10, spacingFromLastCellWhenLoadMoreActionStart: 60)
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
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopNewsTableViewCell", for: indexPath) as! TopNewsTableViewCell
            cell.parentView = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.articleTitle.text = presenter?.textLabelText(indexPath: indexPath)
            cell.articleDescription.text = presenter?.textDescriptionText(indexPath: indexPath)
            cell.articleImage.image = presenter?.imageArticles(indexPath: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            presenter!.scrollViewDidScroll()
        }
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
        //        DispatchQueue.main.async {
        //            self.tableView.reloadData()
        //        }
    }
    
}



