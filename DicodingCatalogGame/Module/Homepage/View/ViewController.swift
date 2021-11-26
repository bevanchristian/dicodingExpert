//
//  ViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 08/08/21.
//  swiftlint:disable force_cast

import UIKit
import Combine
class ViewController: UIViewController {
    @IBOutlet var loadIndicator: UIActivityIndicatorView!
    @IBOutlet var homeCollectionView: UICollectionView!
    var searchControler: UISearchController?
    var subscription = Set<AnyCancellable>()
    var homePageViewModel: HomePageViewModelProtocol?
    var listGame = SearchGameModelUI()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchControler
        searchControler?.searchResultsUpdater = self
        loadIndicator?.startAnimating()
        title = "List Game"
        delegate()
        getDataFromApi()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: ASK DATA FROM VIEWMODEL
    func getDataFromApi() {
        listeningOnChange()
        homePageViewModel?.getGameList()
    }
    
    func listeningOnChange() {
        homePageViewModel?.listGame
            .filter({ data in
                data.results != nil
            }).sink { [self] list in
                loadIndicator.stopAnimating()
                homeCollectionView.reloadData()
                listGame = GameModelMapper.mapSearchGameModelInteractortoUiModel(input: [list])
            }.store(in: &subscription)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    private func delegate() {
        homeCollectionView?.delegate = self
        homeCollectionView?.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listGame.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomepageCollectionViewCell
        cell.fillData = listGame.results?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = homePageViewModel?.moveToDetail(result: listGame.results?[indexPath.row] ?? ResultModelUi(), storyboard: storyboard!)
        navigationController?.pushViewController(detail!, animated: true)
    }
    
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        let searchVc = searchController.searchResultsController as? SearchViewController
        searchVc?.navigasiControler = navigationController
        searchVc?.dataDetail = listGame
        print("text search \(text)")
        searchVc?.searchGame(keyword: text ?? "")
    }
    
}
