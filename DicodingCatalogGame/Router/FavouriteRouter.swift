//
//  FavouriteRouter.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/11/21.
//

import Foundation
import UIKit

class FavouriteRouter {
    func goToDetail(id: String, nama: String, storyboard: UIStoryboard) -> DetailFavViewController {
        let vm = DependencyInjection.init().provideDetailFavViewModel()
        let vc = storyboard.instantiateViewController(identifier: "detailFav") { coder in
            return  DetailFavViewController(coder: coder, detailVM: vm, id: id, nama: nama)
        }
        return vc
    }
    
}
