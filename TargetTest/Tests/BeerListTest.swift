//
//  BeerListTest.swift
//  CATestTest
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import Nimble
@testable import CATest

class BeerListTest: XCTestCase {
    
    let disposeBag: DisposeBag = .init()
    
    func test_Reactor_ViewDidLoad() {
        let beerJson = Bundle.getBeerFromJson(.getBeerList(page: 1))
        
        let reactor = BeerListReactor()
        
        reactor.action.onNext(.viewDidLoad)
        
        print(reactor.currentState.beers)
        XCTAssertEqual(reactor.currentState.beers, beerJson)
        

    }
    

}
