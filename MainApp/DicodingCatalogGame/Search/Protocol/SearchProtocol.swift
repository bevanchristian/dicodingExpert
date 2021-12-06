//
//  SearchProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine

protocol SearchProtocol {
    func getGameList<T: Codable>(byId: Bool, decodeType: T.Type)
    func searchById(id: String)
    func searchByName(gameName: String)
    var hasilSearch: CurrentValueSubject<GameModel, Never> { get set }
    var hasil: PassthroughSubject<DetailModel, Never> { get set }
}
