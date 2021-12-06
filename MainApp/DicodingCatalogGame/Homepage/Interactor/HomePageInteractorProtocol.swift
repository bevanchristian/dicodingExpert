//
//  HomePageInteractorProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

public protocol HomePageInteractorProtocol {
    func getGameList()
    func listeningChangeFromService()
    var listGame: PassthroughSubject<GameModelInteractor, Never> {get set}
}
