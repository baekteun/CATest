import Moya

enum BeerAPI{
    case getBeerList(page: Int)
    case getBeer(id: Int)
    case getRandomBeer
}

extension BeerAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self{
        case .getBeerList:
            return "/beers"
        case let .getBeer(id):
            return "/beers/\(id)"
        case .getRandomBeer:
            return "/beers/random"
        }
    }
    
    var method: Method {
        switch self{
        case .getBeerList, .getBeer, .getRandomBeer:
            return .get
        }
    }
    
    var sampleData: Data{
        return .empty
    }
    
    var task: Task {
        switch self{
        case let .getBeerList(page):
            return .requestParameters(parameters: [
                "page" : page
            ], encoding: URLEncoding.queryString)
        case .getBeer, .getRandomBeer:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
