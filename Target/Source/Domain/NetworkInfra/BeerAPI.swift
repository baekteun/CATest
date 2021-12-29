import Moya

enum BeerAPI{
    case getBeerList(page: Int)
}

extension BeerAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self{
        case .getBeerList:
            return "/beers"
        }
    }
    
    var method: Method {
        switch self{
        case .getBeerList:
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
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
