//
//  GameProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine

protocol GameProtocol {
    func getGameList()
    var hasil: CurrentValueSubject<GameModel, Never> { get set }
}
