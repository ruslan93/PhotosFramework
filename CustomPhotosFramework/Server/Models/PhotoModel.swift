import Foundation

public class PhotoModel: Codable {
    
    public class UrlsModel: Codable {
        public let raw: String
        public let full: String
        public let regular: String
        public let small: String
        public let thumb: String
    }

    public let id: String
    public let height: Int
    public let width: Int
    public let urls: UrlsModel

}


