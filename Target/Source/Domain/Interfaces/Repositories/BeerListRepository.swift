
import RxSwift
import Moya

protocol BeerListRepository{
    func getBeerList(page: Int) -> Single<[Beer]>
}
