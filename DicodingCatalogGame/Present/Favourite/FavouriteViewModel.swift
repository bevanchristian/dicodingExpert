//
//  FavouriteViewModel.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine
import UIKit

class FavouriteViewModel: FavouriteViewModelProtocol {
    let favRouter = FavouriteRouter()
    var favInteractor: FavouriteInteactorProtocol
    var game = PassthroughSubject<[FavouriteModelUI], Never>()
    var subscription = Set<AnyCancellable>()
    init(favInteractor: FavouriteInteactorProtocol) {
        self.favInteractor = favInteractor
        listeningFavInteractor()
    }

    func fetchFromCoreData() {
        favInteractor.fetchFromCoreData()
    }
    
    func listeningFavInteractor() {
        favInteractor.game.sink { [weak self] favData in
            self?.game.send(            FavouriteModelMapper.mapFavouriteModelInteractortoUiModel(input: favData))
        }.store(in: &subscription)
    }
    
    func moveToDetailFav(id: String, nama: String, storyboard: UIStoryboard) -> DetailFavViewController {
        return favRouter.goToDetail(id: id, nama: nama, storyboard: storyboard)
        
    }
}
