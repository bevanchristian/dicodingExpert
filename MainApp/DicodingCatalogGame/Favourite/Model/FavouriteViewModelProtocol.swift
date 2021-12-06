//
//  FavouriteViewModelProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine
import UIKit

protocol FavouriteViewModelProtocol {
    func fetchFromCoreData()
    var game: PassthroughSubject<[FavouriteModelUI], Never> {get set}
    func listeningFavInteractor()
    func moveToDetailFav(id: String, nama: String, storyboard: UIStoryboard) -> DetailFavViewController
}
