//
//  SearchViewModel.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 27/10/21.
//

import Foundation
import Combine
import UIKit

class SearchViewModel: SearchViewModelProtocol {
    let searchRouter = SearchViewRouter()
    let searchInteractorProtocol: SearchInteractorProtocol
    var subscription = Set<AnyCancellable>()
    var listGame = PassthroughSubject<SearchGameModelUI, Never>()
    var hasilPencarian = PassthroughSubject<String, Never>()
    
    init(searchInteractorProtocol: SearchInteractorProtocol) {
        self.searchInteractorProtocol = searchInteractorProtocol
        gettingDataFromSearch()
        load()
    }

    func gettingDataFromSearch() {
        searchInteractorProtocol.listGame.sink { [self] game in
            listGame.send( GameModelMapper.mapSearchGameModelInteractortoUiModel(input: [game]))
        }.store(in: &subscription)
    }

    func load() {
        // di debounce agar tidak hit api terus menerus
        hasilPencarian
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { keyword in
                print("masuk viewmodel search \(keyword)")
                self.searchInteractorProtocol.hasilPencarian.send(keyword)
            }.store(in: &subscription)
        
    }
    
    func moveToDetail(result: ResultModelUi, storyboard: UIStoryboard) -> DetailViewController {
        return searchRouter.goToDetail(result: result, storyboard: storyboard)
    }
}
