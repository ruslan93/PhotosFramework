import Foundation

class PhotoModel: Codable {
    
    class UrlsModel: Codable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }

    let id: String
    let height: Int
    let width: Int
    let urls: UrlsModel

}


