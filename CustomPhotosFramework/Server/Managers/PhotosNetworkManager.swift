import Foundation
import Moya

class PhotosNetworkManagerConfiguration: NSObject {
    var accessKey: String!
    var baseUrl: String!
    
    static let shared = PhotosNetworkManagerConfiguration()

    private override init() {
        super.init()
    }
    
}

class PhotosNetworkManager: BaseNetworkManager {
    
    fileprivate var provider = MoyaProvider<PhotosAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])

    func getPhotos(page: Int = 1, perPage: Int = 30, completion: @escaping (ServerResult<[PhotoModel]>) -> Void) {
        let target = PhotosAPI.getPhotos(page: page, perPage: perPage)
        DispatchQueue.global().async {
            self.provider.request(target) { (result) in
                self.parse(result: result, completion: completion)
            }
        }
    }
    
    func searchPhotos(query: String, page: Int = 1, perPage: Int = 30, completion: @escaping (ServerResult<SearchPhotosResponse>) -> Void) {
        let target = PhotosAPI.searchPhotos(query: query, page: page, perPage: perPage)
        DispatchQueue.global().async {
            self.provider.request(target) { (result) in
                self.parse(result: result, completion: completion)
            }
        }
    }

}
