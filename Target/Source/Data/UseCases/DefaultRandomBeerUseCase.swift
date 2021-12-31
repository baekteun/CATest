//
//  DefaultRandomBeerUseCase.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultRandomBeerUseCase: RandomBeerUsecase{
    @Inject private var randomBeerRepository: RandomBeerRepository
    func execute() -> Single<Beer> {
        return randomBeerRepository.getRandomBeer().compactMap(\.first).asObservable()
            .asSingle()
    }
}
