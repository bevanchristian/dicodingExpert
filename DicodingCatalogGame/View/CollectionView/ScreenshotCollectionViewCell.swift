//
//  ScreenshotCollectionViewCell.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//
// swiftlint:disable line_length
import UIKit
import AlamofireImage

class ScreenshotCollectionViewCell: UICollectionViewCell {
    @IBOutlet var gmbScrenshot: UIImageView!
    var fillData: ShortScreenshot! {
        didSet {
            setUp()
        }
    }
    func setUp() {
        if fillData.image != nil {
            let filter = AspectScaledToFillSizeFilter(size: gmbScrenshot.frame.size)
            gmbScrenshot.af.setImage(withURL: URL(string: fillData.image ?? "https://media.rawg.io/media/games/bda/bdab2603c0dc67268d0610449bc7df16.jpg")!, placeholderImage: UIImage(named: "placeholder"), filter: filter
            )
        }
        gmbScrenshot.layer.cornerRadius = 15
    }
}
