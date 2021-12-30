//
//  BeerSearchReactor.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class BeerSearchReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    @Inject private var beerSearchUseCase: SearchBeerUseCase
    
    // MARK: - Reactor
    enum Action{
        case searchBeer(Int)
    }
    enum Mutation{
        case setBeer(Beer)
        case setError(Error)
        case setLoading(Bool)
    }
    struct State{
        var isLoading = false
        var beer: Beer = .init(id: 0, name: "", description: "", imageUrl: "")
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension BeerSearchReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case let .searchBeer(id):
            return searchBeer(id: id)
        }
    }
}

// MARK: - Reduce
extension BeerSearchReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setBeer(beer):
            newState.beer = beer
        case let .setLoading(isLoading):
            newState.isLoading = isLoading
        case let .setError(err):
            self.steps.accept(CAStep.alert(title: "Beer", message: err.localizedDescription))
        }
        return newState
    }
}


// MARK: - Method
private extension BeerSearchReactor{
    func searchBeer(id: Int) -> Observable<Mutation>{
        let startLoading: Observable<Mutation> = .just(.setLoading(true))
        let beer: Observable<Mutation> = beerSearchUseCase.execute(id: id)
            .asObservable()
            .debug()
            .map { return .setBeer($0) }
            .catch { return .just(.setError($0)) }
        let endLoading: Observable<Mutation> = .just(.setLoading(false))
        return .concat([startLoading, beer, endLoading])
    }
}
