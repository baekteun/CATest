//
//  RandomBeerReactor.swift
//  CATest
//
//  Created by 최형우 on 2021/12/31.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class RandomBeerReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    @Inject private var randomBeerUseCase: RandomBeerUsecase
    
    // MARK: - Reactor
    enum Action{
        case viewDidAppear
    }
    enum Mutation{
        case setIsLoading(Bool)
        case setBeer(Beer)
    }
    struct State{
        var isLoading: Bool = false
        var beer: Beer?
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension RandomBeerReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .viewDidAppear:
            return .empty()
        }
    }
}

// MARK: - Reduce
extension RandomBeerReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setIsLoading(isLoading):
            newState.isLoading = isLoading
        case let .setBeer(beer):
            newState.beer = beer
        }
        return newState
    }
}


// MARK: - Method
private extension RandomBeerReactor{
    func viewDidAppear() -> Observable<Mutation>{
        let start = Observable<Mutation>.just(.setIsLoading(true))
        let req: Observable<Mutation> = randomBeerUseCase
            .execute()
            .asObservable()
            .map{ .setBeer($0) }
        let end = Observable<Mutation>.just(.setIsLoading(false))
        
        return .concat([start,req,end])
    }
}
