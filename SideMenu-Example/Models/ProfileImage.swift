// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profileImage = try? newJSONDecoder().decode(ProfileImage.self, from: jsonData)

import Foundation

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}
