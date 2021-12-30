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
        autoregister(DetailBeerVC.self, initializer: DetailBeerVC.init)
        autoregister(BeerSearchVC.self, initializer: BeerSearchVC.init)
    }
    private func registerReactor(){
        autoregister(BeerListReactor.self, initializer: BeerListReactor.init)
        autoregister(DetailBeerReactor.self, initializer: DetailBeerReactor.init)
        autoregister(BeerSearchReactor.self, initializer: BeerSearchReactor.init)
    }
    private func registerFlow(){
        autoregister(BeerListFlow.self, initializer: BeerListFlow.init)
        autoregister(BeerSearchFlow.self, initializer: BeerSearchFlow.init)
    }
    private func registerStepper(){
        autoregister(BeerListStepper.self, initializer: BeerListStepper.init)
        autoregister(BeerSearchStepper.self, initializer: BeerSearchStepper.init)
    }
    private func registerRepository(){
        autoregister(BeerListRepository.self, initializer: DefaultBeerListRepository.init)
        autoregister(SearchBeerRepository.self, initializer: DefaultSearchBeerRepository.init)
    }
    private func registerUsecase(){
        autoregister(BeerListUseCase.self, initializer: DefaultBeerListUseCase.init)
        autoregister(SearchBeerUseCase.self, initializer: DefaultSearchBeerUseCase.init)
    }
}
