//
//  DetailPageViewModel.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine

class DetailPageViewModel: DetailPageViewModelProtocol {
    var detailPageInteractor: DetailPageInteractorProtocol
    init(detailInteractor: DetailPageInteractorProtocol) {
        self.detailPageInteractor =  detailInteractor
    }
    
    func addFav(dataDetail: ResultModelUi) {
        if !(dataDetail.genres?.isEmpty ?? false) {
            detailPageInteractor.addFav(dataDetail:             ResultModelMapper.mapResultUItoResultInteractor(input: [dataDetail])[0])
        } else {
            detailPageInteractor.addFav(dataDetail:             ResultModelMapper.mapResultUItoResultInteractor(input: [dataDetail])[0])
        }
        
    }
    
    func deleteFav(dataDetail: ResultModelUi) {
        detailPageInteractor.deleteFav(dataDetail:             ResultModelMapper.mapResultUItoResultInteractor(input: [dataDetail])[0])
    }
}
