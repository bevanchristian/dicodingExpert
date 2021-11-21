//
//  HomepageRouter.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 07/11/21.
//
import Foundation
import UIKit
class HomepageRouter {
    
    func goToDetail(result: ResultModelUi, storyboard: UIStoryboard) -> DetailViewController {
        let vm = DependencyInjection.init().provideDetailPageViewModel()
        let vc = storyboard.instantiateViewController(identifier: "detail") { coder in
            return DetailViewController(coder: coder, detailVM: vm, detail: result)
        }
        return vc
    }
    
}
