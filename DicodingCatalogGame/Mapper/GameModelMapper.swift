//
//  GameModelMapper.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation

final class GameModelMapper {

  static func mapGameModeltoInteractorModel(
    input categoryResponses: [GameModel]
  ) -> GameModelInteractor {

    return categoryResponses.map { result in
        return GameModelInteractor(count: result.count, next: result.next, results: ResultModelMapper.mapResultModeltoResultInteractor(input: result.results ?? [Result()]), seoTitle: result.seoTitle, seoDescription: result.seoDescription, seoKeywords: result.seoKeywords, seoH1: result.seoH1, noindex: result.noindex, nofollow: result.nofollow, welcomeDescription: result.welcomeDescription, filters: result.filters, nofollowCollections: result.nofollowCollections)
    }[0]
  }
    
    static func mapGameModelInteractortoUiModel(
      input categoryResponses: [GameModelInteractor]
    ) -> GameModelUI {

      return categoryResponses.map { result in
          return GameModelUI(count: result.count, next: result.next, results: ResultModelMapper.mapResultInteractortoResultUi(input: result.results!), seoTitle: result.seoTitle, seoDescription: result.seoDescription, seoKeywords: result.seoKeywords, seoH1: result.seoH1, noindex: result.noindex, nofollow: result.nofollow, welcomeDescription: result.welcomeDescription, filters: result.filters, nofollowCollections: result.nofollowCollections)
      }[0]
    }
}
