//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    // UI setup
    // Model : UserProfile)
    // binding
    // search control
    // network
    
    /*
     private(set) : 외부에서는 읽기만 가능(getter), 내부에서는 읽기/쓰기 모두 가능 (setter/getter)
     - user 데이터가 update 될때마다 setting
     - network에서 갖고온 user가 nil 일수도 있어서 optional
     */
    @Published private(set) var user: UserProfile?
    var subscription = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = thumbnail.bounds.width / 2
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "hortenssiaa"
        searchController.searchResultsUpdater = self // searchbar의 text detection
        searchController.searchBar.delegate = self // searchbar에서 search button 클릭시의 value detection
        self.navigationItem.searchController = searchController
    }
    
    // user update 될때마다 UI가 update 되게 >> user가 @Published 가 돼야한다.
    private func bind() {
        $user
            .sink { [unowned self] result in
                self.updateUser(result)
            }.store(in: &subscription)
    }
    
    private func updateUser(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.thumbnail.image = nil
            self.followerLabel.text = "n/a"
            self.followingLabel.text = "n/a"
            return
        }
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.thumbnail.image = nil
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
    }
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // network 요청 & 받기
        guard let keyword = searchBar.text, !keyword.isEmpty else { return } // 빈 문자열일 수 있으니
        
        // url
        let base = "https://api.github.com/" // 1. 스키마 & 도메인 주소
        let path = "users/\(keyword)" // 2.
        let params: [String: String] = [:] // 3. parameter (optional)
        let header: [String: String] = ["Content-Type": "application/json"] // 4.
        
        var urlComponents = URLComponents(string: base + path)!
        let queryItem = params.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItem
        
    }
}
