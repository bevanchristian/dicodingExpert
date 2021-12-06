//
//  SearchViewModelProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine
import UIKit

protocol SearchViewModelProtocol {
    func load()
    func gettingDataFromSearch()
    var listGame: PassthroughSubject<SearchGameModelUI, Never> { get set}
    var hasilPencarian: PassthroughSubject<String, Never> { get set}
    func moveToDetail(result: ResultModelUi, storyboard: UIStoryboard) -> DetailViewController
}
