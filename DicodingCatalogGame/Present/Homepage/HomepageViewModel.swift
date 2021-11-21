//
//  HomepageViewModel.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine
import UIKit

class HomepageViewModel: HomePageViewModelProtocol {
    var router = HomepageRouter()
    var listGame = PassthroughSubject<GameModelInteractor, Never>()
    var subscription = Set<AnyCancellable>()
    let homePageInteractor: HomePageInteractorProtocol
    
    init(homeInteractor: HomePageInteractorProtocol) {
        self.homePageInteractor = homeInteractor
        listeningInteractor()
    }
    
    func getGameList() {
        homePageInteractor.getGameList()
    }
    
    // MARK: Terima Data dari interactor
    func listeningInteractor() {
        homePageInteractor.listGame.sink { [self] game in
            self.listGame.send(game)
        }.store(in: &subscription)
    }
    
    func moveToDetail(result: ResultModelUi, storyboard: UIStoryboard) -> DetailViewController {
        return router.goToDetail(result: result, storyboard: storyboard)
    }
}
