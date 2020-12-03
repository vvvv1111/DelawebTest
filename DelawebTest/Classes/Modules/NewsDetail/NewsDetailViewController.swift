//
//  NewsDetailViewController.swift
//  DelawebTest
//
//  Created by Vladimir on 02.12.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterNewsDetailProtocol?
    
}

extension NewsDetailViewController: PresenterToViewNewsDetailProtocol{
    // TODO: Implement View Output Methods
}
