import Foundation
import Moya
import Result

public enum ServerResult<T> {
    case success(T)
    case failure(String)
}

public class BaseNetworkManager {
    
    public func parse<T: Codable>(result: Result<Moya.Response, MoyaError>, completion: @escaping (ServerResult<T>) -> Void) {
        switch result {
        case .success(let response):
            do {
                let results = try JSONDecoder().decode(T.self, from: response.data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error.localizedDescription))
                }
            }
        case .failure(let error):
            DispatchQueue.main.async {
                completion(.failure(error.localizedDescription))
            }
        }
    }

}
