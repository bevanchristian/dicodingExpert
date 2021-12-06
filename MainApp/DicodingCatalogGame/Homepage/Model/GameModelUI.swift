//
//  GameModelUI.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation



public struct HomepageGameModelUI: Codable {
    // var karena belum di declare
    var count: Int?
    var next: String?
    var results: [ResultModelUi]?
    var seoTitle, seoDescription, seoKeywords, seoH1: String?
    var noindex, nofollow: Bool?
    var welcomeDescription: String?
    var filters: Filters?
    var nofollowCollections: [String]?

    public enum CodingKeys: String, CodingKey {
        case count, next, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow
        case welcomeDescription = "description"
        case filters
        case nofollowCollections = "nofollow_collections"
    }
}
