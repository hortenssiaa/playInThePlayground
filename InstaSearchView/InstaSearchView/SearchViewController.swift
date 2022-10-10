//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 2022/10/10.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowlayout?.estimatedItemSize = .zero
        
        self.navigationItem.title = "Search"
        let searchcontroller = UISearchController(searchResultsController: nil)
        searchcontroller.hidesNavigationBarDuringPresentation = false //
        searchcontroller.searchBar.placeholder = "Search"
        searchcontroller.searchResultsUpdater = self // search의 결과를 받아볼 수 있음 - 이 view controller에서
        self.navigationItem.searchController = searchcontroller
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        cell.configure("animal\(indexPath.item+1)")
        return cell
    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        let width: CGFloat = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height: CGFloat = width
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

// search의 결과를 받아볼 수 있음
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search)")
    }
}
