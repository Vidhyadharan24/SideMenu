// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photoLinks = try? newJSONDecoder().decode(PhotoLinks.self, from: jsonData)

import Foundation

// MARK: - PhotoLinks
struct PhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}
