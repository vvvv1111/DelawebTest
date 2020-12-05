//
//  TopNewsTableViewCell.swift
//  DelawebTest
//
//  Created by Vladimir on 04.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class TopNewsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var topNewsCollectionView: UICollectionView!
    
    var presenter: ViewToPresenterTopNewsTableViewProtocol?
    var parentView: UITableViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        topNewsCollectionView.delegate = self
        topNewsCollectionView.dataSource = self
        
        let nib = UINib(nibName: "CustomChildCell", bundle: nil)
        topNewsCollectionView.register(nib, forCellWithReuseIdentifier: "CustomChildCell")
        configureModule()
        presenter?.viewDidLoad()
    }
    
    func configureModule() {
        let presenter: ViewToPresenterTopNewsTableViewProtocol & InteractorToPresenterTopNewsTableViewProtocol = TopNewsTableViewPresenter()
        
        self.presenter = presenter
        self.presenter?.router = TopNewsTableViewRouter()
        self.presenter?.view = self
        self.presenter?.interactor = TopNewsTableViewInteractor()
        self.presenter?.interactor?.presenter = presenter
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Collection view methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomChildCell", for: indexPath) as! CustomChildCell
        cell.cellLabel.text = presenter?.textLabelText(indexPath: indexPath)
        cell.cellDesciption.text = presenter?.textDescriptionText(indexPath: indexPath)
        
        cell.cellImage.image = presenter?.imageArticles(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectCellAt(index: indexPath.row, on: parentView!)
    }
    
    
}


extension TopNewsTableViewCell: PresenterToViewTopNewsTableViewProtocol{
       func onFetchImagesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.topNewsCollectionView.reloadData()
        }
    }
    
    func onFetchArticlesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.topNewsCollectionView.reloadData()
        }
    }
}
