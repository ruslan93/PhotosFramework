import Foundation
import Moya
import SwifterSwift

enum PhotosAPI {
    case getPhotos(page: Int, perPage: Int)
    case searchPhotos(query: String, page: Int, perPage: Int)
}

extension PhotosAPI: TargetType {
    
    var path: String {
        switch self {
        case .getPhotos:
            return "photos"
        case .searchPhotos:
            return "search/photos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        
        var parameters: [String: String] = [:]
        parameters["client_id"] = PhotosNetworkManagerConfiguration.shared.accessKey
        
        switch self {
        case .getPhotos(let page, let perPage):
            parameters["page"] = page.string
            parameters["per_page"] = perPage.string
        case .searchPhotos(let query, let page, let perPage):
            parameters["page"] = page.string
            parameters["per_page"] = perPage.string
            parameters["query"] = query
        }
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
}

extension TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: PhotosNetworkManagerConfiguration.shared.baseUrl) else { fatalError("Base URL is wrong") }
        return url
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let parameters: [String: String] = [:]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }

}
