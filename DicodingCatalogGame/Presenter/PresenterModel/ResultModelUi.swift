//
//  ResultModelUi.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation

struct ResultModelUi: Codable {
    var id: Int?
    var slug, name, released: String?
    var tba: Bool?
    var backgroundImage: String?
    var rating: Double?
    var ratingTop: Int?
    var ratings: [Rating]?
    var ratingsCount, reviewsTextCount, added: Int?
    var addedByStatus: AddedByStatus?
    var metacritic: Int?
    var playtime, suggestionsCount: Int?
    var updated: String?
    var reviewsCount: Int?
    var saturatedColor, dominantColor: Color?
    var platforms: [PlatformElement]?
    var parentPlatforms: [ParentPlatform]?
    var genres: [Genre]?
    var stores: [Store]?
    var tags: [Genre]?
    var esrbRating: EsrbRating?
    var shortScreenshots: [ShortScreenshot]?

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case updated
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, tags
        case esrbRating = "esrb_rating"
        case shortScreenshots = "short_screenshots"
    }
}
