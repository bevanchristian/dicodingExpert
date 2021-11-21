//
//  DetailModelUI.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation

struct DetailModelUI: Codable {
    var id: Int?
    var slug, name, description: String?
    var released: String?
    var background_image: String?
    var rating: Double?
    var platforms: [PlatformElement2]?
    var stores: [Store2]?
    var developers, genres: [Developer]?
}
