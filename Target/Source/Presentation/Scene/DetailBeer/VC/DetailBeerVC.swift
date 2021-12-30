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
    private let beerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let beerIDLabel = UILabel().then {
        $0.textColor = .orange
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    private let beerNameLabel = UILabel().then {
        $0.textColor = .black
    }
    
    private let beerDescriptionLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.numberOfLines = 0
    }
    
    private let beerStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }
    
    // MARK: - Init
    init(beer: Beer){
        super.init()
        bindBeer(beer: beer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    override func addView() {
        beerStack.addArrangeSubviews([beerIDLabel, beerNameLabel, beerDescriptionLabel])
        [beerImageView, beerStack].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        beerImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(bound.height*0.1)
            $0.width.height.equalTo(200)
        }
        beerStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(beerImageView.snp.bottom).offset(bound.height*0.05)
        }
    }
    override func configureVC() {
        
    }
    private func bindBeer(beer: Beer){
        self.beerImageView.kf.setImage(with: URL(string: beer.imageUrl) ?? .none)
        self.beerIDLabel.text = "\(beer.id)"
        self.beerNameLabel.text = beer.name
        self.beerDescriptionLabel.text = beer.description
    }
    // MARK: - Reactor
    override func bindState(reactor: DetailBeerReactor) {
        
    }
}
