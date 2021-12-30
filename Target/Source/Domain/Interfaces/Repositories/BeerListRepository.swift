
import RxSwift

protocol BeerListRepository{
    func getBeerList(page: Int) -> Single<[Beer]>
}
