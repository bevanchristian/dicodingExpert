//
//  DetailFavViewModelProtocol.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine
import UIKit

protocol DetailFavViewModelProtocol {
    func fetchCoreData(id: String)
    func getDataFromApi()
    var dataDetail: PassthroughSubject<DetailModelUI, Never> {get set}
    func addFav(dataDetail: DetailModelUI)
    func deleteFav(dataDetail: DetailModelUI)
    func moveToGitView(url: String, storyboard: UIStoryboard) -> GithubViewController
}
