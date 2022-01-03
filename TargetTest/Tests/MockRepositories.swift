//
//  MockRepositories.swift
//  CATestTest
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import RxSwift
@testable import CATest

extension Bundle{
    static func getBeerFromJson(_ api: BeerAPI) -> [Beer]{
        let path = Bundle.main.path(forResource: "stub", ofType: "bundle")
        let bundle = Bundle(path: path!)
        switch api{
        case .getBeerList:
            return bundle!.decode([Beer].self, from: "BeerList.json")
        case .getBeer:
            return bundle!.decode([Beer].self, from: "SingleBeer.json")
        case .getRandomBeer:
            return bundle!.decode([Beer].self, from: "RandomBeer.json")
        }
        return [Beer]()
    }
}

class MockBeerListRepository: BeerListRepository{
    func getBeerList(page: Int) -> Single<[Beer]> {
        return Single.just(Bundle.getBeerFromJson(.getBeerList(page: page)))
    }
}

class MockSearchBeerRepository: SearchBeerRepository{
    func getBeer(id: Int) -> Single<[Beer]> {
        return Single.just(Bundle.getBeerFromJson(.getBeer(id: id)))
    }
}

class MockRandomBeerRepository: RandomBeerRepository{
    func getRandomBeer() -> Single<[Beer]> {
        return Single.just(Bundle.getBeerFromJson(.getRandomBeer))
    }
}
