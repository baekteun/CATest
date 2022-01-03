//
//  BeerSearchTest.swift
//  CATestTest
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import XCTest
@testable import CATest

class BeerSearchTest: XCTestCase{
    func testReactorStateIsLoading() {
        let reactor = BeerSearchReactor()
        
        reactor.action.onNext(.searchBeer(1))
        
        XCTAssertEqual(reactor.currentState.isLoading, true)
    }
    
    func testReactorState() {
        let reactor = BeerSearchReactor()
        
        let beer = Bundle.getBeerFromJson(.getBeer(id: 3))
        
        reactor.action.onNext(.searchBeer(3))
        
        XCTAssertEqual(reactor.currentState.beer, beer[0])
    }
}
