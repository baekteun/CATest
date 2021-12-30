//
//  BeerSearchVC.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import RxSwiftExt

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
    
    // MARK: - Reactor
    override func bindView(reactor: BeerSearchReactor) {
        searchController.searchBar.rx.text
            .orEmpty
            .filter{ $0 != "" }
            .debounce(.microseconds(5), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map(Int.init)
            .unwrap()
            .map { Reactor.Action.searchBeer($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    override func bindState(reactor: BeerSearchReactor) {
        let sharedState = reactor.state.share(replay: 2)
        
        sharedState
            .withUnretained(self)
            .map { $0.1.beer }
            .subscribe(onNext: {
                self.beerView.bind(beer: $0)
            })
            .disposed(by: disposeBag)
        
        sharedState
            .withUnretained(self)
            .map { $0.1.isLoading }
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
