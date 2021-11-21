//
//  DicodingCatalogGameTests.swift
//  DicodingCatalogGameTests
//
//  Created by bevan christian on 08/08/21.
//

import XCTest
import Combine
@testable import DicodingCatalogGame

class DicodingCatalogGameTests: XCTestCase {
    
    var service = GameApiFetch()
    
    func testGameApiFetch() {
        var subscription: AnyCancellable?
        var terima = GameModel()
        var expectation = expectation(description: "apifetch")
        service.getGameList()
        subscription = service.hasil.dropFirst().sink { data in
            terima = data
            print(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(terima.count!, 2)
        print(terima)
    }
}
