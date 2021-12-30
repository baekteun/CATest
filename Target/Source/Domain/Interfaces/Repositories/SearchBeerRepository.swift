//
//  SearchBeerRepository.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift

protocol SearchBeerRepository{
    func getBeer(id: Int) -> Single<[Beer]>
}
