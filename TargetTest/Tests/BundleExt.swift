//
//  BundleExt.swift
//  CATestTest
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
@testable import CATest

extension Bundle {
    static func getBeerFromJson(_ api: BeerAPI) -> [Beer] {
        let bundlePath = Bundle.main.path(forResource: "Stub", ofType: "bundle")
        let bundle = Bundle(path: bundlePath!)
        switch api {
        case .getBeerList:
            return bundle!.decode([Beer].self, from: "BeerList.json")
        case .getRandomBeer:
            return bundle!.decode([Beer].self, from: "RandomBeer.json")
        case .getBeer:
            return bundle!.decode([Beer].self, from: "SingleBeer.json")
        }
        return [Beer]()
    }
}
