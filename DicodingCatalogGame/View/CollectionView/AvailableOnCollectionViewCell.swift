//
//  AvailableOnCollectionViewCell.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//

import UIKit
import AlamofireImage

class AvailableOnCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageAvail: UIImageView!
    @IBOutlet var platformLbl: UILabel!

    var fillData: PlatformElement! {
        didSet {
            setUp()
        }
    }
    func setUp() {
        let filter = AspectScaledToFillSizeFilter(size: imageAvail.frame.size)
        imageAvail.af.setImage(withURL: URL(string: fillData.platform?.imageBackground ?? "https://media.rawg.io/media/games/bda/bdab2603c0dc67268d0610449bc7df16.jpg")!, filter: filter)
        imageAvail.layer.cornerRadius = 10
        platformLbl.text = fillData.platform?.name ?? "No Data"
    }
    
}
