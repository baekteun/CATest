//
//  DetailBeerVC.swift
//  CATest
//
//  Created by 최형우 on 2021/12/29.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

final class DetailBeerVC: baseVC<DetailBeerReactor>{
    // MARK: - Properties
    private let beerView = BeerView()
    
    // MARK: - Init
    init(beer: Beer){
        super.init()
        beerView.bind(beer: beer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    override func addView() {
        [beerView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        beerView.snp.makeConstraints {
            $0.top.equalTo(view.layoutMarginsGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    override func configureVC() {
        
    }
    
}
