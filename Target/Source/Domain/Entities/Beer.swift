

struct Beer: Codable, Equatable{
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey{
        case id, name, description
        case imageUrl = "image_url"
    }
}
