//
//  ContainerDependencies.swift
//  CATest
//
//  Created by 최형우 on 2021/12/29.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container{
    func registerDependencies(){
        registerVC()
        registerReactor()
        registerFlow()
        registerStepper()
        registerRepository()
        registerUsecase()
    }
    
    private func registerVC(){
        autoregister(BeerListVC.self, initializer: BeerListVC.init)
    }
    private func registerReactor(){
        autoregister(BeerListReactor.self, initializer: BeerListReactor.init)
    }
    private func registerFlow(){
        autoregister(BeerListFlow.self, initializer: BeerListFlow.init)
    }
    private func registerStepper(){
        autoregister(BeerListStepper.self, initializer: BeerListStepper.init)
    }
    private func registerRepository(){
        
    }
    private func registerUsecase(){
        
    }
}
