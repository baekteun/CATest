//
//  BeerView.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import Kingfisher

final class BeerView: UIView{
    // MARK: - Properties
    private let beerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.snp.makeConstraints {
            $0.width.height.equalTo(200)
        }
    }
    
    private let beerIDLabel = UILabel().then {
        $0.textColor = .orange
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    private let beerNameLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "Please Search Beer by id"
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
    override func draw(_ rect: CGRect) {
        beerStack.addArrangeSubviews([beerImageView, beerIDLabel, beerNameLabel, beerDescriptionLabel])
        addSubview(beerStack)
        beerStack.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(5)
        }
    }
    
    // MARK: - Method
    func bind(beer: Beer){
        beerImageView.kf.setImage(with: URL(string: beer.imageUrl) ?? .none)
        beerIDLabel.text = "\(beer.id)"
        beerNameLabel.text = beer.name
        beerDescriptionLabel.text = beer.description
    }
}
