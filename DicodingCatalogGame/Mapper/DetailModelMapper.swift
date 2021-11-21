//
//  DetailModelMapper.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//
// swiftlint:disable line_length
import Foundation

final class DetailModelMapper {

  static func mapDetailModeltoInteractorModel (
    input detailModel: [DetailModel]
  ) -> DetailModelInteractor {

    return detailModel.map { result in
        return DetailModelInteractor(id: result.id, slug: result.slug, name: result.name, description: result.description, released: result.released, background_image: result.background_image, rating: result.rating, platforms: result.platforms, stores: result.stores, developers: result.developers, genres: result.genres)
    }[0]
  }
    
    
static func mapDetailInteractorModeltoUiModel (
      input detailModel: [DetailModelInteractor]
    ) -> DetailModelUI {

      return detailModel.map { result in
          return DetailModelUI(id: result.id, slug: result.slug, name: result.name, description: result.description, released: result.released, background_image: result.background_image, rating: result.rating, platforms: result.platforms, stores: result.stores, developers: result.developers, genres: result.genres)
      }[0]
    }
    
    static func mapDetailUItoInteractorModel (
          input detailModel: [DetailModelUI]
        ) -> DetailModelInteractor {

          return detailModel.map { result in
              return DetailModelInteractor(id: result.id, slug: result.slug, name: result.name, description: result.description, released: result.released, background_image: result.background_image, rating: result.rating, platforms: result.platforms, stores: result.stores, developers: result.developers, genres: result.genres)
          }[0]
        }
  
}
