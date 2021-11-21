//
//  FavouriteCollectionViewCell.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//

import UIKit
import AlamofireImage

class FavouriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageFav: UIImageView!
    @IBOutlet var titleFav: UILabel!
    @IBOutlet var releasedFav: UILabel!
    @IBOutlet var ratingFav: UILabel!
    @IBOutlet var genreFav: UILabel!
    
    var fillData: FavouriteModelUI? {
        didSet {
            setUp()
        }
    }
    func setUp() {
        if fillData?.name != "" {
            titleFav.text = fillData?.name ?? "No Name"
            genreFav.text = fillData?.genre ?? "Uknown"
            releasedFav.text = fillData?.released ?? "No Tba"
            ratingFav.text = fillData?.rating ?? ""
            let filter = AspectScaledToFillSizeFilter(size: imageFav.frame.size)
            imageFav.af.setImage(withURL: (URL(string: fillData?.backgroundImage ?? "") ?? URL(string: ""))!, placeholderImage: UIImage(named: "placeholder"), filter: filter)
            imageFav.layer.cornerRadius = 10
        }
    }
    
}
