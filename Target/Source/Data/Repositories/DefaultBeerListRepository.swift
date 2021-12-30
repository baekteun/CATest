//
//  DefaultBeerListRepository.swift
//  CATest
//
//  Created by 최형우 on 2021/12/29.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultBeerListRepository: BeerListRepository{
    func getBeerList(page: Int) -> Single<[Beer]> {
        return NetworkManager.shared.request(api: .getBeerList(page: page), dto: [Beer].self)
    }
    
    
}
