import Foundation
import Moya

public class PhotosNetworkManagerConfiguration: NSObject {
    public var accessKey: String!
    public var baseUrl: String!
    
    public static let shared = PhotosNetworkManagerConfiguration()

    private override init() {
        super.init()
    }
    
}

public class PhotosNetworkManager: BaseNetworkManager {
    
    public override init() {
        super.init()
    }
    
    fileprivate var provider = MoyaProvider<PhotosAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])

    public func getPhotos(page: Int = 1, perPage: Int = 30, completion: @escaping (ServerResult<[PhotoModel]>) -> Void) {
        let target = PhotosAPI.getPhotos(page: page, perPage: perPage)
        DispatchQueue.global().async {
            self.provider.request(target) { (result) in
                self.parse(result: result, completion: completion)
            }
        }
    }
    
    public func searchPhotos(query: String, page: Int = 1, perPage: Int = 30, completion: @escaping (ServerResult<SearchPhotosResponse>) -> Void) {
        let target = PhotosAPI.searchPhotos(query: query, page: page, perPage: perPage)
        DispatchQueue.global().async {
            self.provider.request(target) { (result) in
                self.parse(result: result, completion: completion)
            }
        }
    }

}
