// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try? newJSONDecoder().decode(Photo.self, from: jsonData)

import Foundation

// MARK: - Photo
struct Photo: Codable, Identifiable {
    let id: String
    let createdAt, updatedAt: Date
    let width, height: Int
    let color: String
    let photoDescription, altDescription: String?
    let urls: Urls
    let links: PhotoLinks
    let likes: Int
    let likedByUser: Bool
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case photoDescription = "description"
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case user
    }
}
