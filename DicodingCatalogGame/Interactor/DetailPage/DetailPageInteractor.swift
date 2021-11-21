//
//  DetailPageInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//
// swiftlint:disable line_length
import Foundation

class DetailPageInteractor: DetailPageInteractorProtocol {
    var coreDataService: localRepoProtocol
    init(repoService: localRepoProtocol = CoreDataService.shared) {
        self.coreDataService = repoService
    }
    
    func addFav(dataDetail: ResultModelInteractor) {
        if !(dataDetail.genres?.isEmpty ?? false) {
            coreDataService.addFav(dataDetail.name ?? "", dataDetail.genres?[0].name ?? "", dataDetail.released ?? "", dataDetail.backgroundImage ?? "", String(dataDetail.rating!), Int64(dataDetail.id!))
        } else {
            coreDataService.addFav(dataDetail.name ?? "", "", dataDetail.released ?? "", dataDetail.backgroundImage ?? "", String(dataDetail.rating!), Int64(dataDetail.id!))
        }
       
    }
    
    func deleteFav(dataDetail: ResultModelInteractor) {
        coreDataService.deleteFav(dataDetail.name ?? "") {
            print("delete sukses")
        }
    }
}
