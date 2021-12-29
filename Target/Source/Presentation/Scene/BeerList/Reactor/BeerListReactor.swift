import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class BeerListReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    private var page = 1
    
    @Inject private var beerListUseCase: BeerListUseCase
    
    // MARK: - Reactor
    enum Action{
        case viewDidLoad
        case fetchMoreBeer
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
        case .fetchMoreBeer:
            return fetchMoreBeer()
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
        return beerListUseCase.execute(page: self.page)
            .asObservable()
            .withUnretained(self)
            .do(onError: {
                print($0.localizedDescription)
                self.steps.accept(CAStep.alert(title: "BeerList", message: "아이템을 불러오는데 실패했습니다."))
            })
            .map { .setBeers($0.1) }
    }
    func fetchMoreBeer() -> Observable<Mutation>{
        self.page += 1
        return beerListUseCase.execute(page: self.page)
            .asObservable()
            .withUnretained(self)
            .do(onError: {
                print($0.localizedDescription)
                self.steps.accept(CAStep.alert(title: "BeerList", message: "아이템을 불러오는데 실패했습니다."))
            })
            .map { .setBeers($0.1) }
            
            
            
            
    }
}
