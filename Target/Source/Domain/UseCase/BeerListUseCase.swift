import RxSwift
import Moya

protocol BeerListUseCase{
    func execute(page: Int) -> Single<Response>
}
