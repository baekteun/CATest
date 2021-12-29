import RxSwift
import Moya

protocol BeerListUseCase{
    func execute(page: Int) -> Single<[Beer]>
}

final class DefaultBeerListUseCase: BeerListUseCase{
    
    @Inject private var beerListRepository: BeerListRepository
    
    func execute(page: Int) -> Single<[Beer]> {
        return beerListRepository.getBeerList(page: page)
    }
}
