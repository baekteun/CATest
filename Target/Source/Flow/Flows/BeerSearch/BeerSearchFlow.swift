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
    @Inject private var vc: BeerSearchVC
    @Inject var stepper: BeerSearchStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asCAStep else { return .none }
        switch step{
        case .beerIDSearchIsRequired:
            return coordinateToBeerSearch()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension BeerSearchFlow{
    func coordinateToBeerSearch() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
}
