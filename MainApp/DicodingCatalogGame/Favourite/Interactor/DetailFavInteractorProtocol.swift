//
//  DetailFavInteractorProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine

protocol DetailFavInteractorProtocol {
    func fetchCoreData(id: String)
    func getDataFromApi()
    var dataDetail: PassthroughSubject<DetailModelInteractor, Never> {get set}
    func addFav(dataDetail: DetailModelInteractor)
    func deleteFav(dataDetail: DetailModelInteractor)
}
