//
//  AvailFavCollectionViewCell.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//

import UIKit
import AlamofireImage
class AvailFavCollectionViewCell: UICollectionViewCell {
    @IBOutlet var labelPlatform: UILabel!
    @IBOutlet var imagePlatform: UIImageView!
    
    var fillData: PlatformElement2! {
        didSet {
            setUp()
        }
    }
    func setUp() {
        let filter = AspectScaledToFillSizeFilter(size: imagePlatform.frame.size)
        imagePlatform.af.setImage(withURL: URL(string: fillData.platform?.image_background ?? "https://media.rawg.io/media/games/bda/bdab2603c0dc67268d0610449bc7df16.jpg")!, filter: filter)
        imagePlatform.layer.cornerRadius = 10
        labelPlatform.text = fillData.platform?.name ?? "No Data"
    }
}
