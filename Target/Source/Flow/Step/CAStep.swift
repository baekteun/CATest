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
    
    // Main Tabbar
    case mainTabbarIsRequired
    
    // BeerList
    case beerListIsRequired
    case beerDetailIsRequired(beer: Beer)
    
    case beerIDSearchIsRequired
    
    case randomBeerIsRequired
}
