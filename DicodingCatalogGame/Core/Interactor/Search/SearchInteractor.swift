//
//  SearchInteractor.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
import Combine



class SearchInteractor: SearchInteractorProtocol {
    let searchService: SearchProtocol
    var subscription = Set<AnyCancellable>()
    var listGame = PassthroughSubject<GameModelInteractor, Never>()
    var hasilPencarian = PassthroughSubject<String, Never>()
    
    init(searchService: SearchProtocol = SearchService.shared) {
        self.searchService = searchService
        gettingDataFromSearch()
        load()
    }

    func gettingDataFromSearch() {
        searchService.hasilSearch.dropFirst().eraseToAnyPublisher().sink { [self] game in
            listGame.send(GameModelMapper.mapGameModeltoInteractorModel(input: [game]))
        }.store(in: &subscription)
    }

    func load() {
        // di debounce agar tidak hit api terus menerus
        hasilPencarian
            .filter({ cek in
                cek != ""
            })

            .sink { keyword in
                self.searchService.searchByName(gameName: keyword)
            }.store(in: &subscription)
        
    }
}
