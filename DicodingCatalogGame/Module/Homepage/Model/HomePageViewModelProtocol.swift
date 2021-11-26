//
//  HomePageViewModelProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine
import UIKit

protocol HomePageViewModelProtocol {
    func getGameList()
    func listeningInteractor()
    var listGame: PassthroughSubject<GameModelInteractor, Never> {get set}
    func moveToDetail(result: ResultModelUi, storyboard: UIStoryboard) -> DetailViewController
}
