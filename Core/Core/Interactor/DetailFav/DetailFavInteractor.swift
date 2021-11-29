//
//  DetailFavInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

// swiftlint:disable line_length
import Foundation
import Combine

class DetailFavInteractor: DetailFavInteractorProtocol {
    var apiSearch: SearchProtocol
    var dataDetail = PassthroughSubject<DetailModelInteractor, Never>()
    var coreDataDetailService: localRepoProtocol
    var subscription = Set<AnyCancellable>()
    
    init(searchService: SearchProtocol = SearchService.shared, coreLocal: localRepoProtocol = CoreDataService.shared) {
        self.apiSearch = searchService
        self.coreDataDetailService = coreLocal
        getDataFromApi()
    }
    
    func fetchCoreData(id: String) {
       
        apiSearch.searchById(id: id)
    }
    
    func getDataFromApi() {
        apiSearch.hasil.sink { [self] list in
            dataDetail.send(            DetailModelMapper.mapDetailModeltoInteractorModel(input: [list]))
        }.store(in: &subscription)
    }
    
    func addFav(dataDetail: DetailModelInteractor) {
        coreDataDetailService.addFav(dataDetail.name ?? "", dataDetail.genres?[0].name ?? "", dataDetail.released ?? "", dataDetail.background_image ?? "", String(dataDetail.rating!), Int64(dataDetail.id!))
    }
    
    func deleteFav(dataDetail: DetailModelInteractor) {
        coreDataDetailService.deleteFav(dataDetail.name ?? "") {
            print("delete sukses")
        }
    }
}
