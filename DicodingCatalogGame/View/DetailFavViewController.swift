//
//  DetailFavViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//
// swiftlint:disable force_cast
import UIKit
import Combine
class DetailFavViewController: UIViewController {
    @IBOutlet var gambar: UIImageView!
    @IBOutlet var gameTitle: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var minimum: UILabel!
    @IBOutlet var recomended: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var loadIndicator: UIActivityIndicatorView!
    @IBOutlet var storeTableView: UITableView!
    @IBOutlet var favScrollView: UIScrollView!
    @IBOutlet var availableCollectionView: UICollectionView!
    let detailFavViewModel: DetailFavViewModelProtocol
    var subscription = Set<AnyCancellable>()
    
    var dataDetail = DetailModelUI()
    var isLike = false
    var nama = ""
    var idGame = ""
    
    required init?(coder: NSCoder, detailVM: DetailFavViewModelProtocol, id: String, nama: String) {
        self.detailFavViewModel = detailVM
        self.nama = nama
        self.idGame = id
        print("nama \(nama)")
        print("idgame \(id)")
        super.init(coder: coder)
        fetchCoreData(id: idGame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndicator.startAnimating()
        cekLike()
        delegate()
        self.favScrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1300)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        cekLike()
    }
    
    func cekLike() {
        for data in favList {
            if data.name == nama {
                likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                isLike = true
                break
            } else {
                likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                isLike = false
            }
        }
    }
    
    private func delegate() {
        storeTableView.delegate = self
        storeTableView.dataSource = self
        availableCollectionView.delegate = self
        availableCollectionView.dataSource = self
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        isLike.toggle()
        if isLike {
            detailFavViewModel.addFav(dataDetail: dataDetail)
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            detailFavViewModel.deleteFav(dataDetail: dataDetail)
        }
    }
    
    // akan di proses jika di fetch dari fav
    func fetchCoreData(id: String) {
        getDataFromApi()
        detailFavViewModel.fetchCoreData(id: id)
    }
    
    func getDataFromApi() {
        detailFavViewModel.dataDetail.sink { [self] list in
            loadIndicator.hidesWhenStopped = true
            loadIndicator.stopAnimating()
            print("terima dari detail \(list)")
            dataDetail = list
            setUpView()
            availableCollectionView.reloadData()
            storeTableView.reloadData()
            availableCollectionView.reloadData()
        }.store(in: &subscription)
    }
    
    func setUpView() {
        gambar.af.setImage(withURL: (URL(string: dataDetail.background_image!) ?? URL(string: "https://media.rawg.io/media/games/bda/bdab2603c0dc67268d0610449bc7df16.jpg"))!)
        gameTitle.text = dataDetail.name ?? "No Name"
        if dataDetail.platforms != nil {
            for recomend in dataDetail.platforms! {
                if recomend.requirements?.recommended != nil {
                    recomended.text = recomend.requirements?.recommended ?? "No Data"
                }
            }
            for recomend in dataDetail.platforms! {
                if recomend.requirements?.minimum != nil {
                    minimum.text = recomend.requirements?.minimum ?? "No Data"
                }
            }
        } else {
            recomended.text = "No Data"
            minimum.text = "No Data"
        }
        
        releaseDate.text = dataDetail.released
        if !(dataDetail.genres?.isEmpty ?? true) {
            genre.text = dataDetail.genres?[0].name ?? "No Genre"
        }
        descriptionLabel.text = dataDetail.description ?? "No Data"
    }
}

extension DetailFavViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataDetail.platforms?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellPlatform = collectionView.dequeueReusableCell(withReuseIdentifier: "availCellFav", for: indexPath) as! AvailFavCollectionViewCell
        cellPlatform.fillData = dataDetail.platforms?[indexPath.row]
        return cellPlatform
    }
}
extension DetailFavViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDetail.stores?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath)
        cell.textLabel?.text = dataDetail.stores?[indexPath.row].store?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if dataDetail.stores?[indexPath.row].store?.domain?.rawValue != nil {
            let gitView = detailFavViewModel.moveToGitView(url: dataDetail.stores?[indexPath.row].store?.domain?.urlSwitch ?? "https://www.apple.com", storyboard: storyboard!)
            navigationController?.pushViewController(gitView, animated: true)
        } else {
            let alert = UIAlertController(title: "No Website", message: "This Company Doesnt have any Website", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
