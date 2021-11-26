//
//  SearchViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//
// swiftlint:disable force_cast
import UIKit
import Combine

class SearchViewController: UITableViewController {
    @IBOutlet var searchTableView2: UITableView!
    var searchViewModel: SearchViewModelProtocol?
    var dataDetail = SearchGameModelUI()
    var listGame = SearchGameModelUI()
    var navigasiControler: UINavigationController?
    var subscription = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView2 = UITableView()
        tableView.register(SearchCollectionViewCell.self, forCellReuseIdentifier: "searchCell")
        gettingDataFromSearch()
    }
    
    required init?(coder: NSCoder, searchVm: SearchViewModelProtocol) {
        self.searchViewModel = searchVm
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func gettingDataFromSearch() {
        listeningOnChange()
        searchViewModel?.gettingDataFromSearch()
    }
    
    private func listeningOnChange() {
        searchViewModel?.listGame.dropFirst().sink { [self] gameData in
            listGame = gameData
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }.store(in: &subscription)
    }
    
    func searchGame(keyword: String) {
        searchViewModel?.load()
        print("masuk vc \(keyword)")
        searchViewModel?.hasilPencarian.send(keyword)
    }
}

extension SearchViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCollectionViewCell
        cell.textLabel?.text = listGame.results?[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let detail = (searchViewModel?.moveToDetail(result: listGame.results?[indexPath.row] ?? ResultModelUi(), storyboard: storyb))!
        navigasiControler?.pushViewController(detail, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listGame.results?.count ?? 0
    }
}
