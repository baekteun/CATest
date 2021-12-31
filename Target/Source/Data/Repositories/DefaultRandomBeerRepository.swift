//
//  DefaultRandomBeerRepository.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultRandomBeerRepository: RandomBeerRepository{
    func getRandomBeer() -> Single<[Beer]> {
        return NetworkManager.shared.request(api: .getRandomBeer, dto: [Beer].self)
    }
}
