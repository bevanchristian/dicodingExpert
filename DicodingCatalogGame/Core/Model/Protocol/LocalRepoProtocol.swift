//
//  LocalRepoProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation

protocol localRepoProtocol {
    func fetchFav(completion: @escaping([FavouriteModel]?, CoreDataError?) -> Void)
    func deleteFav(_ name: String, completion: @escaping() -> Void)
    func addFav(_ name: String, _ genre: String, _ released: String, _ backImage: String, _ rating: String, _ id: Int64)
}
