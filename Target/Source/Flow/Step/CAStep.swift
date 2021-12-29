//
//  CAStep.swift
//  CATest
//
//  Created by 최형우 on 2021/12/29.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

enum CAStep: Step{
    // Global
    case alert(title: String?, message: String)
    case dismiss
    
    // Main
    case mainTabbarIsRequired
    
    case beerListIsRequired
    case beerDetailIsRequired(withID: Int)
    
    case beerIDSearchIsRequired
    
    case randomBeerIsRequired
}
