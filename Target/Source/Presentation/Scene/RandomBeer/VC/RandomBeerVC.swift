//
//  RandomBeerVC.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxViewController
import RxSwift
import RxSwiftExt

final class RandomBeerVC: baseVC<RandomBeerReactor>{
    // MARK: - Properties
    private let beerView = BeerView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - UI
    override func addView() {
        [beerView, activityIndicator].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        beerView.snp.makeConstraints {
            $0.top.equalTo(view.layoutMargins)
            $0.size.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: RandomBeerReactor) {
        self.rx.viewDidAppear
            .map { _ in Reactor.Action.viewDidAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
    }
    override func bindState(reactor: RandomBeerReactor) {
        let sharedState = reactor.state.share(replay: 2).observe(on: MainScheduler.asyncInstance)
        
        sharedState
            .map { $0.beer }
            .withUnretained(self)
            .map(\.1)
            .unwrap()
            .subscribe(onNext: {
                self.beerView.bind(beer: $0)
            })
            .disposed(by: disposeBag)
        
        sharedState
            .map { $0.isLoading }
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
