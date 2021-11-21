//
//  DetailFavouriteRouter.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/11/21.
//

import Foundation
import UIKit


class DetailFavouriteRouter {
    
    func goToGitView(url: String, storyboard: UIStoryboard) -> GithubViewController {
        let vc = storyboard.instantiateViewController(identifier: "webView") { coder in
            return  GithubViewController(coder: coder, urlString: url)
        }
        return vc
    }
    
}
