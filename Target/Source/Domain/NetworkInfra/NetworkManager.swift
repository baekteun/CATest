import Moya
import RxSwift

protocol NetworkManagerType{
    var provider: MoyaProvider<BeerAPI> { get }
    
    func request<T: Decodable>(api: BeerAPI, dto: T.Type) -> Single<T>
}

final class NetworkManager: NetworkManagerType{
    var provider: MoyaProvider<BeerAPI> = .init()
    
    static let shared = NetworkManager()
    
    func request<T: Decodable>(api: BeerAPI, dto: T.Type) -> Single<T> {
        return provider.rx.request(api).map(T.self)
    }
}


