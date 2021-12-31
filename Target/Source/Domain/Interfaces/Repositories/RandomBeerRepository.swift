//
//  RandomBeerRepository.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Moya
import RxSwift

protocol RandomBeerRepository{
    func getRandomBeer() -> Single<[Beer]>
}
