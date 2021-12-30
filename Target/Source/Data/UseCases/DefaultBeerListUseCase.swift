//
//  DefaultBeerListUseCase.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultBeerListUseCase: BeerListUseCase{
    
    @Inject private var beerListRepository: BeerListRepository
    
    func execute(page: Int) -> Single<[Beer]> {
        return beerListRepository.getBeerList(page: page)
    }
}
