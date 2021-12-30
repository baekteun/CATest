//
//  DefaultSearchBeerRepository.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

final class DefaultSearchBeerRepository: SearchBeerRepository{
    func getBeer(id: Int) -> Single<[Beer]> {
        return NetworkManager.shared.request(api: .getBeer(id: id), dto: [Beer].self)
    }
}
