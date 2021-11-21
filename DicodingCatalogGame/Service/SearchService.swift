//
//  SearchFavourite.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//
// swiftlint:disable force_cast

import Foundation
import Combine

class SearchService: SearchProtocol {
    static let shared = SearchService()
    private var urlComponent: URLComponents!
    private var subscription = Set<AnyCancellable>()
    var hasil = PassthroughSubject<DetailModel, Never>()
    var hasilSearch = CurrentValueSubject<GameModel, Never>(GameModel())
    
    func searchById(id: String) {
        urlComponent = URLComponents(string: UrlPenting.detail(id).urlString)
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: UrlPenting.game.apiKey)
        ]
        getGameList(byId: true, decodeType: DetailModel.self)
    }
    
    func searchByName(gameName: String) {
        urlComponent = URLComponents(string: UrlPenting.game.urlString)
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: UrlPenting.game.apiKey),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "page_size", value: "15"),
            URLQueryItem(name: "search", value: gameName)
        ]
        getGameList(byId: false, decodeType: GameModel.self)
    }
    
    func getGameList<T: Codable>(byId: Bool, decodeType: T.Type) {
        guard let urlFix = try? URLRequest(url: (urlComponent?.url)!) else {return}
        URLSession.shared.dataTaskPublisher(for: urlFix)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return output.data
            }
            .decode(type: decodeType, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let err):
                    print("error search \(err.localizedDescription)")
                }
            } receiveValue: { hasil in
                if byId {
                    self.hasil.send(hasil as! DetailModel)
                } else {
                    self.hasilSearch.send(hasil as! GameModel)
                }
                
            }.store(in: &subscription)
    }
    
}
