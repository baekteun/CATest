//
//  RandomBeerTest.swift
//  CATestTest
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import XCTest
@testable import CATest

class RandomBeerTest: XCTestCase{
    
    func testReactorStateIsLoading() {
        let reactor = RandomBeerReactor()
        
        reactor.action.onNext(.viewDidAppear)
        
        XCTAssertEqual(reactor.currentState.isLoading, true)
    }
    
    
}
