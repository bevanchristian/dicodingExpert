//
//  HomepageCollectionViewCell.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 08/08/21.
//

import UIKit
import AlamofireImage

class HomepageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var rating: UILabel!
    @IBOutlet var relaseDate: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var genre: UILabel!
    @IBOutlet var gameTitle: UILabel!
    
    var fillData: ResultModelUi! {
        didSet {
            setUp()
        }
    }
    
    func setUp() {
        gameTitle.text = fillData.name ?? "No Name"
        genre.text = fillData.genres?[0].name ?? "Uknown"
        relaseDate.text = fillData.released ?? "No Tba"
        rating.text = String(fillData.rating ?? 0.0) as String
        let filter = AspectScaledToFillSizeFilter(size: image.frame.size)
        image.af.setImage(withURL: URL(string: fillData.backgroundImage!)!, placeholderImage: UIImage(named: "placeholder"), filter: filter)
        image.layer.cornerRadius = 10
    }
}
