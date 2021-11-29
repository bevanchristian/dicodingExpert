//
//  FavouriteModelMapper.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 13/11/21.
//

import Foundation


final class FavouriteModelMapper {

  static func mapFavouriteModeltoInteractorModel(
    input favModel: [FavouriteModel]
  ) -> [FavouriteModelInteractor] {

    return favModel.map { result in
        return FavouriteModelInteractor(id: result.id, name: result.name, genre: result.genre, released: result.released, rating: result.rating, backgroundImage: result.backgroundImage)
    }
  }
    
    static func mapFavouriteModelInteractortoUiModel(
      input favModel: [FavouriteModelInteractor]
    ) -> [FavouriteModelUI] {

      return favModel.map { result in
          return FavouriteModelUI(id: result.id, name: result.name, genre: result.genre, released: result.released, rating: result.rating, backgroundImage: result.backgroundImage)
      }
    }
  
}
