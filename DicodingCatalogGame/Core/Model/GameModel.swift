import Foundation

// MARK: - Welcome
struct GameModel: Codable {
    // var karena belum di declare
    var count: Int?
    var next: String?
    var results: [Result]?
    var seoTitle, seoDescription, seoKeywords, seoH1: String?
    var noindex, nofollow: Bool?
    var welcomeDescription: String?
    var filters: Filters?
    var nofollowCollections: [String]?

    enum CodingKeys: String, CodingKey {
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

// MARK: - Filters
struct Filters: Codable {
    var years: [FiltersYear]?
}

// MARK: - FiltersYear
struct FiltersYear: Codable {
    var from, to: Double?
    var filter: String?
    var decade: Int?
    var years: [YearYear]?
    var nofollow: Bool?
    var count: Int?
}

// MARK: - YearYear
struct YearYear: Codable {
    var year, count: Double?
    var nofollow: Bool?
}

// MARK: - Result
struct Result: Codable {
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

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    var yet, owned, beaten, toplay: Int?
    var dropped, playing: Int?
}

enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

// MARK: - EsrbRating
struct EsrbRating: Codable {
    var id: Int?
    var name: Name?
    var slug: Slug?
}

enum Name: String, Codable {
    case adultsOnly = "Adults Only"
    case android = "Android"
    case appleMacintosh = "Apple Macintosh"
    case everyone = "Everyone"
    case everyone10 = "Everyone 10+"
    case iOS = "iOS"
    case linux = "Linux"
    case mature = "Mature"
    case nintendo = "Nintendo"
    case pc = "PC"
    case playStation = "PlayStation"
    case teen = "Teen"
    case web = "Web"
    case xbox = "Xbox"
    case nameEn = "name_en"
    case nameRu = "name_ru"
}

enum Slug: String, Codable {
    case adultsOnly = "adults-only"
    case android = "android"
    case everyone = "everyone"
    case everyone10Plus = "everyone-10-plus"
    case ios = "ios"
    case linux = "linux"
    case mac = "mac"
    case mature = "mature"
    case nintendo = "nintendo"
    case pc = "pc"
    case playstation = "playstation"
    case teen = "teen"
    case web = "web"
    case xbox = "xbox"
}

// MARK: - Genre
struct Genre: Codable {
    var id: Double?
    var name, slug: String?
    var gamesCount: Int?
    var imageBackground: String?
    var domain: Domain?
    var language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

enum Domain: String, Codable {
    case appsAppleCOM = "apps.apple.com"
    case epicgamesCOM = "epicgames.com"
    case gogCOM = "gog.com"
    case marketplaceXboxCOM = "marketplace.xbox.com"
    case microsoftCOM = "microsoft.com"
    case nintendoCOM = "nintendo.com"
    case playGoogleCOM = "play.google.com"
    case storePlaystationCOM = "store.playstation.com"
    case storeSteampoweredCOM = "store.steampowered.com"
    var urlSwitch: String {
        switch self {
        case .appsAppleCOM :
            return "https://www.apple.com/app-store/"
        case .epicgamesCOM :
            return "https://www.epicgames.com/store/en-US/"
        case .gogCOM:
            return "https://www.gog.com"
        case .marketplaceXboxCOM:
            return "https://marketplace.xbox.com/en-US/"
        case .microsoftCOM:
            return "https://www.microsoft.com/id-id/"
        case .nintendoCOM:
            return "https://www.nintendo.com"
        case .playGoogleCOM:
            return "https://play.google.com/store"
        case .storePlaystationCOM:
            return "https://store.playstation.com/en-id/latest"
        case .storeSteampoweredCOM:
            return "https://store.steampowered.com"
        }
    }
}

enum Language: String, Codable {
    case eng = "eng"
    case rus = "rus"
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    var platform: EsrbRating?
}

// MARK: - PlatformElement
struct PlatformElement: Codable {
    var platform: PlatformPlatform?
    var releasedAt: String?
    var requirementsEn, requirementsRu: Requirements?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
}

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    var id: Int?
    var name, slug: String?
    var gamesCount: Double?
    var imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - Requirements
struct Requirements: Codable {
    var minimum, recommended: String?
}

// MARK: - Rating
struct Rating: Codable {
    var id: Double?
    var title: Title?
    var count: Double?
    var percent: Double?
}

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    var id: Double?
    var image: String?
}

// MARK: - Store
struct Store: Codable {
    var id: Double?
    var store: Genre?
}
