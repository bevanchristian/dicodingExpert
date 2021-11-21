//
//  GithubViewController.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 09/08/21.
//

import UIKit
import WebKit
import Combine

class GithubViewController: UIViewController, WKNavigationDelegate {
    var subscription = Set<AnyCancellable>()
    var progress = PassthroughSubject<Double, Never>()
    var urlString = ""
    @IBOutlet var viewWeb: WKWebView!
    @IBOutlet var loadIndicator: UIActivityIndicatorView!
    private var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndicator.startAnimating()
        viewWeb.navigationDelegate = self
        getData()
    }
    
    required init?(coder: NSCoder, urlString: String) {
        self.urlString = urlString
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        webRequest()
    }
    func webRequest() {
        // merequest link github
        viewWeb.load(URLRequest(url: URL(string: urlString)! ))
        // untuk mengobservasi progress
        observation = viewWeb.observe(\.estimatedProgress, options: [.new]) { [self] _, _ in
            progress.send(viewWeb.estimatedProgress)
        }
        viewWeb.allowsBackForwardNavigationGestures = true
    }
    
    func getData() {
        progress.sink { [self] proses in
            if proses == 1 {
                print("sukses")
                loadIndicator.stopAnimating()
            } else {
                print("load")
            }
        }.store(in: &subscription)
    }
    
    deinit {
        observation = nil
    }
}
