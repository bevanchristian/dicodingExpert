//
//  HomepageInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

class HomepageInteractor: HomePageInteractorProtocol {
    var serviceGameFetch: GameProtocol
    var subscription = Set<AnyCancellable>()
    var listGame = PassthroughSubject<GameModelInteractor, Never>()
    
    init(gameFetchService: GameProtocol = GameApiFetch.shared) {
        serviceGameFetch = gameFetchService
        listeningChangeFromService()
    }
    
    func getGameList() {
        serviceGameFetch.getGameList()
    }
    
    // MARK: Terima Data dari service
    func listeningChangeFromService() {
        serviceGameFetch.hasil.sink { [self] game in
            self.listGame.send(GameModelMapper.mapGameModeltoInteractorModel(input: [game]))
        }.store(in: &subscription)
    }
}
