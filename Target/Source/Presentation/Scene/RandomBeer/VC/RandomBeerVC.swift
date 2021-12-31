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

final class RandomBeerVC: baseVC<RandomBeerReactor>{
    // MARK: - Properties
    private let beerView = BeerView()
    
    // MARK: - UI
    override func addView() {
        view.addSubview(beerView)
    }
    override func setLayout() {
        beerView.snp.makeConstraints {
            $0.top.equalTo(view.layoutMargins)
            $0.size.equalToSuperview()
        }
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: RandomBeerReactor) {
        self.rx.viewDidAppear
            .map { _ in Reactor.Action.viewDidAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
    }
}
