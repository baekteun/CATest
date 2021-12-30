//
//  BeerSearchVC.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

final class BeerSearchVC: baseVC<BeerSearchReactor>{
    // MARK: - Properties
    private let beerView = BeerView()
    private let searchController = UISearchController(searchResultsController: nil)
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - UI
    override func addView() {
        [beerView, activityIndicator].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        beerView.snp.makeConstraints {
            $0.top.equalTo(view.layoutMarginsGuide)
            $0.size.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    override func configureVC() {
        setupNavigation()
        setupSearch()
    }
    private func setupNavigation(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Search By ID"
        self.navigationItem.accessibilityLabel = "Search By ID"
    }
    private func setupSearch(){
        self.navigationItem.searchController = searchController
        searchController.searchBar.keyboardType = .numberPad
    }
    
}
