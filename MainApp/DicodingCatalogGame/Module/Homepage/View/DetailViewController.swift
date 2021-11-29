//
//  DetailViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//
// swiftlint:disable force_cast

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var availableCollectionView: UICollectionView!
    @IBOutlet var storeWebTableView: UITableView!
    @IBOutlet var gameImage: UIImageView!
    @IBOutlet var screenshotCollectionView: UICollectionView!
    @IBOutlet var recomendeLabel: UILabel!
    @IBOutlet var minimumRequire: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var titleName: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var scroll: UIView!
    var fetchFromCoreData = false
    var isLike = false
    var dataDetail = ResultModelUi()
    var detailPageViewModel: DetailPageViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        cekLike()
        if !fetchFromCoreData {
            setUpView()
        }
        delegate()
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1300)
        
    }
    
    required init?(coder: NSCoder, detailVM: DetailPageViewModelProtocol, detail: ResultModelUi) {
        self.dataDetail = detail
        self.detailPageViewModel = detailVM
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        cekLike()
    }
    
    func cekLike() {
        for data in favList {
            if data.name == dataDetail.name ?? "" {
                print("apakah sama \(data.name) dan \(dataDetail.name!) jumlah favlist \(favList.count)")
                likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                isLike = true
                break
            } else {
                likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                isLike = false
            }
        }
    }
    
    func setUpView() {
        gameImage.af.setImage(withURL: (URL(string: dataDetail.backgroundImage!) ?? URL(string: "https://media.rawg.io/media/games/bda/bdab2603c0dc67268d0610449bc7df16.jpg"))!)
        titleName.text = dataDetail.name ?? "No Name"
        if dataDetail.platforms != nil {
            for recomend in dataDetail.platforms! {
                if recomend.requirementsEn?.recommended != nil {
                    recomendeLabel.text = recomend.requirementsEn?.recommended ?? "No Data"
                }
            }
            for recomend in dataDetail.platforms! {
                if recomend.requirementsEn?.minimum != nil {
                    minimumRequire.text = recomend.requirementsEn?.minimum ?? "No Data"
                }
            }
        } else {
            recomendeLabel.text = "No Data"
            minimumRequire.text = "No Data"
        }
        
        releaseDate.text = dataDetail.released
        if !(dataDetail.genres?.isEmpty ?? true) {
            genre.text = dataDetail.genres?[0].name ?? "No Genre"
        }
    }
    
    @IBAction func likeAction(_ sender: UIButton) {
        isLike.toggle()
        if isLike {
            detailPageViewModel?.addFav(dataDetail: dataDetail)
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            detailPageViewModel?.deleteFav(dataDetail: dataDetail)
        }
        
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func delegate() {
        availableCollectionView.delegate = self
        availableCollectionView.dataSource = self
        storeWebTableView.delegate = self
        storeWebTableView.dataSource = self
        screenshotCollectionView.delegate = self
        screenshotCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == screenshotCollectionView {
            return dataDetail.shortScreenshots?.count ?? 0
        } else {
            return dataDetail.platforms?.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == screenshotCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotCell", for: indexPath) as! ScreenshotCollectionViewCell
            cell.fillData = dataDetail.shortScreenshots?[indexPath.row]
            return cell
        } else {
            let cellPlatform = collectionView.dequeueReusableCell(withReuseIdentifier: "availCell", for: indexPath) as! AvailableOnCollectionViewCell
            cellPlatform.fillData = dataDetail.platforms?[indexPath.row]
            return cellPlatform
        }
        
    }
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
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
            let gitView = storyboard?.instantiateViewController(identifier: "webView") as! GithubViewController
            gitView.urlString = dataDetail.stores?[indexPath.row].store?.domain?.urlSwitch ?? "https://www.apple.com"
            navigationController?.pushViewController(gitView, animated: true)
        } else {
            let alert = UIAlertController(title: "No Website", message: "This Company Doesnt have any Website", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
