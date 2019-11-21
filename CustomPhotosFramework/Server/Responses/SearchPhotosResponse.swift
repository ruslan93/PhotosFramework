import Foundation

public class SearchPhotosResponse: Codable {
    public let total: Int
    public let totalPages: Int
    public let results: [PhotoModel]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }

}

