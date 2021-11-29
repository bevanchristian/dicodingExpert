//
//  DetailPageViewModelInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

protocol DetailPageViewModelProtocol {
    func addFav(dataDetail: ResultModelUi)
    func deleteFav(dataDetail: ResultModelUi)
}
