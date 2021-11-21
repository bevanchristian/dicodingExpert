//
//  FavouriteInteactorProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

protocol FavouriteInteactorProtocol {
    func fetchFromCoreData()
    var game: PassthroughSubject<[FavouriteModelInteractor], Never> {get set}
}
