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
        autoregister(RandomBeerVC.self, initializer: RandomBeerVC.init)
    }
    private func registerReactor(){
        autoregister(BeerListReactor.self, initializer: BeerListReactor.init)
        autoregister(DetailBeerReactor.self, initializer: DetailBeerReactor.init)
        autoregister(BeerSearchReactor.self, initializer: BeerSearchReactor.init)
        autoregister(RandomBeerReactor.self, initializer: RandomBeerReactor.init)
    }
    private func registerFlow(){
        autoregister(BeerListFlow.self, initializer: BeerListFlow.init)
        autoregister(BeerSearchFlow.self, initializer: BeerSearchFlow.init)
        autoregister(RandomBeerFlow.self, initializer: RandomBeerFlow.init)
    }
    private func registerStepper(){
        autoregister(BeerListStepper.self, initializer: BeerListStepper.init)
        autoregister(BeerSearchStepper.self, initializer: BeerSearchStepper.init)
        autoregister(RandomBeerStepper.self, initializer: RandomBeerStepper.init)
    }
    private func registerRepository(){
        autoregister(BeerListRepository.self, initializer: DefaultBeerListRepository.init)
        autoregister(SearchBeerRepository.self, initializer: DefaultSearchBeerRepository.init)
        autoregister(RandomBeerRepository.self, initializer: DefaultRandomBeerRepository.init)
    }
    private func registerUsecase(){
        autoregister(BeerListUseCase.self, initializer: DefaultBeerListUseCase.init)
        autoregister(SearchBeerUseCase.self, initializer: DefaultSearchBeerUseCase.init)
        autoregister(RandomBeerUsecase.self, initializer: DefaultRandomBeerUseCase.init)
    }
}
