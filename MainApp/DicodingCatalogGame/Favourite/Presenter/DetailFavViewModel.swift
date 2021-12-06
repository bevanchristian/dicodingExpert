//
//  DetailFavViewModel.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine
import UIKit

class DetailFavViewModel: DetailFavViewModelProtocol {
    let detailFavouriteRouter = DetailFavouriteRouter()
    let detailFavInteractor: DetailFavInteractorProtocol
    var dataDetail = PassthroughSubject<DetailModelUI, Never>()
    var coreDataService = CoreDataService()
    var subscription = Set<AnyCancellable>()
    
    init(detailFavInteractor: DetailFavInteractorProtocol) {
        self.detailFavInteractor = detailFavInteractor
        getDataFromApi()
    }
    
    func fetchCoreData(id: String) {
        detailFavInteractor.fetchCoreData(id: id)
    }
    
    func getDataFromApi() {
        detailFavInteractor.dataDetail.sink { [self] list in
            dataDetail.send(            DetailModelMapper.mapDetailInteractorModeltoUiModel(input: [list]))
        }.store(in: &subscription)
    }
    
    func addFav(dataDetail: DetailModelUI) {
        detailFavInteractor.addFav(dataDetail:         DetailModelMapper.mapDetailUItoInteractorModel(input: [dataDetail]))
    }
    
    func deleteFav(dataDetail: DetailModelUI) {
        detailFavInteractor.deleteFav(dataDetail:         DetailModelMapper.mapDetailUItoInteractorModel(input: [dataDetail]))
    }
    
    func moveToGitView(url: String, storyboard: UIStoryboard) -> GithubViewController {
        return detailFavouriteRouter.goToGitView(url: url, storyboard: storyboard)
        
    }

}
