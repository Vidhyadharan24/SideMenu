// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sponsorship = try? newJSONDecoder().decode(Sponsorship.self, from: jsonData)

import Foundation

// MARK: - Sponsorship
struct Sponsorship: Codable {
    let impressionsID, tagline: String
    let sponsor: User

    enum CodingKeys: String, CodingKey {
        case impressionsID = "impressions_id"
        case tagline, sponsor
    }
}
