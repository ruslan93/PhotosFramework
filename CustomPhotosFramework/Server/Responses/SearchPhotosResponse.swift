import Foundation

class SearchPhotosResponse: Codable {
    let total: Int
    let totalPages: Int
    let results: [PhotoModel]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }

}

