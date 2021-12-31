//
//  RandomBeerFlow.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct RandomBeerStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return CAStep.randomBeerIsRequired
    }
}

final class RandomBeerFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    @Inject private var vc: RandomBeerVC
    @Inject private var reactor: RandomBeerReactor
    @Inject var stepper: RandomBeerStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asCAStep else { return .none }
        
        switch step{
        case .randomBeerIsRequired:
            return coordinateToRandomBeer()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension RandomBeerFlow{
    func coordinateToRandomBeer() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
