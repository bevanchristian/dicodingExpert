//
//  GameApiFetch.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 08/08/21.
//

import Foundation
import Combine

class GameApiFetch: GameProtocol {
    static let shared = GameApiFetch()
    var urlComponent = URLComponents(string: UrlPenting.game.urlString)
    var subscription = Set<AnyCancellable>()
    var hasil = CurrentValueSubject<GameModel, Never>(GameModel())
    init() {
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: UrlPenting.game.apiKey),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "page_size", value: "100")
            
        ]
    }
    
    func getGameList() {
        guard let urlFix = try? URLRequest(url: (urlComponent?.url)!) else {return}
        URLSession.shared.dataTaskPublisher(for: urlFix)
            .retry(3)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                print(output.data)
                return output.data
            }
            .decode(type: GameModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let err):
                    print("error ss\(err.localizedDescription)")
                }
            } receiveValue: { hasil in
                self.hasil.send(hasil)
            }.store(in: &subscription)
    }
}
