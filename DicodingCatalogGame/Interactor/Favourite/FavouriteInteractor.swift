//
//  FavouriteInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

class FavouriteInteractor: FavouriteInteactorProtocol {
    var coreDataService: localRepoProtocol
    var game = PassthroughSubject<[FavouriteModelInteractor], Never>()
    init(repoService: localRepoProtocol = CoreDataService.shared) {
        self.coreDataService = repoService
    }

    func fetchFromCoreData() {
        coreDataService.fetchFav { [self] listFav, errr in
            if errr == nil {
                game.send(FavouriteModelMapper.mapFavouriteModeltoInteractorModel(input: listFav!))
            } else {
                print("fetch data error")
            }
        }
    }
}
