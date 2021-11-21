//
//  ResultModelMapper.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation

final class ResultModelMapper {
    
    
    static func mapResultInteractortoResultUi (
        input resultInteractor: [ResultModelInteractor]
    ) -> [ResultModelUi] {
        return resultInteractor.map { result in
            return ResultModelUi(id: result.id, slug: result.slug, name: result.name, released: result.released, tba: result.tba, backgroundImage: result.backgroundImage, rating: result.rating, ratingTop: result.ratingTop, ratings: result.ratings, ratingsCount: result.ratingsCount, reviewsTextCount: result.reviewsTextCount, added: result.added, addedByStatus: result.addedByStatus, metacritic: result.metacritic, playtime: result.playtime, suggestionsCount: result.suggestionsCount, updated: result.updated, reviewsCount: result.reviewsCount, saturatedColor: result.saturatedColor, dominantColor: result.dominantColor, platforms: result.platforms, parentPlatforms: result.parentPlatforms, genres: result.genres, stores: result.stores, tags: result.genres, esrbRating: result.esrbRating, shortScreenshots: result.shortScreenshots)
        }
    }
    
    static func mapResultUItoResultInteractor (
        input resultUi: [ResultModelUi]
    ) -> [ResultModelInteractor] {
        return resultUi.map { result in
            return ResultModelInteractor(id: result.id, slug: result.slug, name: result.name, released: result.released, tba: result.tba, backgroundImage: result.backgroundImage, rating: result.rating, ratingTop: result.ratingTop, ratings: result.ratings, ratingsCount: result.ratingsCount, reviewsTextCount: result.reviewsTextCount, added: result.added, addedByStatus: result.addedByStatus, metacritic: result.metacritic, playtime: result.playtime, suggestionsCount: result.suggestionsCount, updated: result.updated, reviewsCount: result.reviewsCount, saturatedColor: result.saturatedColor, dominantColor: result.dominantColor, platforms: result.platforms, parentPlatforms: result.parentPlatforms, genres: result.genres, stores: result.stores, tags: result.genres, esrbRating: result.esrbRating, shortScreenshots: result.shortScreenshots)
        }
    }
    
    static func mapResultModeltoResultInteractor (
        input resultUi: [Result]
    ) -> [ResultModelInteractor] {
        
        return resultUi.map { result in
            return ResultModelInteractor(id: result.id, slug: result.slug, name: result.name, released: result.released, tba: result.tba, backgroundImage: result.backgroundImage, rating: result.rating, ratingTop: result.ratingTop, ratings: result.ratings, ratingsCount: result.ratingsCount, reviewsTextCount: result.reviewsTextCount, added: result.added, addedByStatus: result.addedByStatus, metacritic: result.metacritic, playtime: result.playtime, suggestionsCount: result.suggestionsCount, updated: result.updated, reviewsCount: result.reviewsCount, saturatedColor: result.saturatedColor, dominantColor: result.dominantColor, platforms: result.platforms, parentPlatforms: result.parentPlatforms, genres: result.genres, stores: result.stores, tags: result.genres, esrbRating: result.esrbRating, shortScreenshots: result.shortScreenshots)
        }
    }
    
}
