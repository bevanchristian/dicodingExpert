//
//  SearchModelMapper.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 06/12/21.
//

import Foundation


final class SearchModelMapper {

  static func mapGameModeltoInteractorModel(
    input categoryResponses: [GameModel]
  ) -> GameModelInteractor {

    return categoryResponses.map { result in
        return GameModelInteractor(count: result.count, next: result.next, results: ResultModelMapper.mapResultModeltoResultInteractor(input: result.results ?? [Result()]), seoTitle: result.seoTitle, seoDescription: result.seoDescription, seoKeywords: result.seoKeywords, seoH1: result.seoH1, noindex: result.noindex, nofollow: result.nofollow, welcomeDescription: result.welcomeDescription, filters: result.filters, nofollowCollections: result.nofollowCollections)
    }[0]
  }
    
    static func mapHomepageGameModelInteractortoUiModel(
      input categoryResponses: [GameModelInteractor]
    ) -> HomepageGameModelUI {

      return categoryResponses.map { result in
          return HomepageGameModelUI(count: result.count, next: result.next, results: ResultModelMapper.mapResultInteractortoResultUi(input: result.results!), seoTitle: result.seoTitle, seoDescription: result.seoDescription, seoKeywords: result.seoKeywords, seoH1: result.seoH1, noindex: result.noindex, nofollow: result.nofollow, welcomeDescription: result.welcomeDescription, filters: result.filters, nofollowCollections: result.nofollowCollections)
      }[0]
    }
    
    static func mapSearchGameModelInteractortoUiModel(
      input categoryResponses: [GameModelInteractor]
    ) -> SearchGameModelUI {

      return categoryResponses.map { result in
          return SearchGameModelUI(count: result.count, next: result.next, results: ResultModelMapper.mapResultInteractortoResultUi(input: result.results!), seoTitle: result.seoTitle, seoDescription: result.seoDescription, seoKeywords: result.seoKeywords, seoH1: result.seoH1, noindex: result.noindex, nofollow: result.nofollow, welcomeDescription: result.welcomeDescription, filters: result.filters, nofollowCollections: result.nofollowCollections)
      }[0]
    }
}
