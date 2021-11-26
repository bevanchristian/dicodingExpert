//
//  ProfilViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//
// swiftlint:disable force_cast
import UIKit

class ProfilViewController: UIViewController {
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var profilTextView: UITextView!
    @IBOutlet var backdrop: UIView!
    @IBOutlet var profilImage: UIImageView!
    var isEdit = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        profilTextView.textColor = .gray
        editButton.title = "Edit"
        title = "Profile"
        backdrop.layer.cornerRadius = 15
        profilImage.layer.cornerRadius = 10
    }
    
    func setUpView() {
        if UserDefaults.standard.value(forKey: "bio") != nil {
            profilTextView.text = UserDefaults.standard.value(forKey: "bio") as? String
        }
    }
    @IBAction func editBio(_ sender: UIBarButtonItem) {
        isEdit.toggle()
        if isEdit {
            editButton.title = "Done"
            profilTextView.isEditable = true
            profilTextView.textColor = .black
        } else {
            editButton.title = "Edit"
            profilTextView.isEditable = false
            profilTextView.textColor = .gray
            UserDefaults.standard.setValue(profilTextView.text, forKey: "bio")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpView()
        
    }
//    
//    @IBAction func githubBtn(_ sender: UIButton) {
//        let gitView = storyboard?.instantiateViewController(identifier: "webView") as! GithubViewController
//        gitView.urlString = "https://gitlab.com/bevankevin0"
//        navigationController?.pushViewController(gitView, animated: true)
//    }
}
