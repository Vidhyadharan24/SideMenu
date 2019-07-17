// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photoElement = try? newJSONDecoder().decode(PhotoElement.self, from: jsonData)

import Foundation
import SwiftUI

// MARK: - PhotoElement
struct Photo: Codable, Identifiable {
    let id: String
    let createdAt, updatedAt: Date
    let width, height: Int
    let color: String
    let photoDescription, altDescription: String?
    let urls: Urls
    let links: PhotoLinks
    let categories: [JSONAny]
    let sponsored: Bool
    let sponsoredBy: User?
    let sponsoredImpressionsID: String?
    let likes: Int
    let likedByUser: Bool
    let currentUserCollections: [JSONAny]
    let user: User
    let sponsorship: Sponsorship?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case photoDescription = "description"
        case altDescription = "alt_description"
        case urls, links, categories, sponsored
        case sponsoredBy = "sponsored_by"
        case sponsoredImpressionsID = "sponsored_impressions_id"
        case likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case user, sponsorship
    }
}
