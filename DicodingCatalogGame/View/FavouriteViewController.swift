//
//  FavouriteViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//
// swiftlint:disable force_cast
import UIKit
import Combine

class FavouriteViewController: UIViewController {
    @IBOutlet var favoriteCollectionView: UICollectionView!
    var favouriteViewModel: FavouriteViewModelProtocol?
    var game = [FavouriteModelUI]()
    var subscription = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourite"
        delegate()
        game.removeAll()
        fetchFromCoreData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        game.removeAll()
        fetchFromCoreData()
    }
    
    func fetchFromCoreData() {
        listeningOnChange()
        favouriteViewModel?.fetchFromCoreData()
    }
    
    private func listeningOnChange() {
        favouriteViewModel?.game
            .dropFirst()
            .sink { [weak self] favData in
                self?.game = favData
                self?.favoriteCollectionView.reloadData()
            }.store(in: &subscription)
    }
    
}

extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func delegate() {
        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.count 
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as! FavouriteCollectionViewCell
        cell.fillData = game[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = favouriteViewModel!.moveToDetailFav(id: String(game[indexPath.row].id), nama: game[indexPath.row].name, storyboard: storyboard!)
        navigationController?.pushViewController(detail, animated: true)
    }
}
