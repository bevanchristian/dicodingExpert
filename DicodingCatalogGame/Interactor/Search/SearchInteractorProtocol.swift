//
//  SearchInteractorProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

protocol SearchInteractorProtocol {
    func load()
    func gettingDataFromSearch()
    var listGame: PassthroughSubject<GameModelInteractor, Never> { get set}
    var hasilPencarian: PassthroughSubject<String, Never> { get set}
}
