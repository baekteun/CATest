//
//  DefaultSearchBeerUseCase.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultSearchBeerUseCase: SearchBeerUseCase{
    
    @Inject private var searchBeerRepository: SearchBeerRepository
    
    func execute(id: Int) -> Single<Beer> {
        return searchBeerRepository.getBeer(id: id).compactMap(\.first).asObservable().asSingle()
    }
}
