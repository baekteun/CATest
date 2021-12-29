import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class BeerListReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
        case viewDidLoad
        case loadMoreData
    }
    enum Mutation{
        case setBeers([Beer])
    }
    struct State{
        var beers: [Beer] = []
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension BeerListReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .viewDidLoad:
            return fetchBeer()
        case .loadMoreData:
            return loadMoreData()
        }
    }
}

// MARK: - Reduce
extension BeerListReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setBeers(beer):
            newState.beers = beer
        }
        return newState
    }
}


// MARK: - Method
private extension BeerListReactor{
    func fetchBeer() -> Observable<Mutation>{
        return .just(.setBeers([
            Beer(id: 1, name: "a", description: "a", imageUrl: ""),
            Beer(id: 2, name: "b", description: "b", imageUrl: "")
        ]))
    }
    func loadMoreData() -> Observable<Mutation>{
        
        return .empty()
    }
}
