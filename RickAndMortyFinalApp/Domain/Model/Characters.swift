
struct Characters: Decodable {
    let identifier: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case status
        case species
        case image
        case gender
    }
}
