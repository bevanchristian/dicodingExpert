import Foundation

// MARK: - Welcome
struct DetailModel: Codable {
    var id: Int?
    var slug, name, description: String?
    var released: String?
    var background_image: String?
    var rating: Double?
    var platforms: [PlatformElement2]?
    var stores: [Store2]?
    var developers, genres: [Developer]?
}

// MARK: - Developer
struct Developer: Codable {
    var name, slug: String?
    var image_background: String?
    var domain: Domain?
}
// MARK: - PlatformElement
struct PlatformElement2: Codable {
    var platform: PlatformPlatform2?
    var requirements: Requirements2?
}

// MARK: - PlatformPlatform
struct PlatformPlatform2: Codable {
    var id: Int?
    var name, slug: String?
    var image_background: String?
}

// MARK: - Requirements
struct Requirements2: Codable {
    var minimum, recommended: String?
}

// MARK: - Store
struct Store2: Codable {
    var id: Int?
    var url: String?
    var store: Developer?
}
