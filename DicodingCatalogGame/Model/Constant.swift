//
//  Constant.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 08/08/21.
//

import Foundation

var favList = [FavouriteModel]()

enum UrlPenting {
    case game
    case detail(String)
    // menggunakan var karena computed property
    var apiKey: String {
        return "b0769048ccad4fd3b6d8414de8d0d5c8"
    }
    var urlString: String {
        switch self {
        case .game:
            return "https://api.rawg.io/api/games"
        case .detail(let id):
            return "https://api.rawg.io/api/games/\(id)?key=b0769048ccad4fd3b6d8414de8d0d5c8"
        }
    }
}

enum CoreDataError: Error {
    case saveError
    case updateError
    case uknown
    case fetchError
}
