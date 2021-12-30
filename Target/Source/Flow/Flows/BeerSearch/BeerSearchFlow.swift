//
//  BeerSearchFlow.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct BeerSearchStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return CAStep.beerIDSearchIsRequired
    }
}

final class BeerSearchFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: BeerSearchStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    init(
        with stepper: BeerSearchStepper
    ){
        self.stepper = stepper
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asCAStep else { return .none }
        switch step{
            
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension BeerSearchFlow{
    
}
