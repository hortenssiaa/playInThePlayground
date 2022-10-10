//
//  HomeViewController.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 2022/10/10.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        
        let flowlayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout
        flowlayout?.estimatedItemSize = .zero
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.configure("animal\(indexPath.item+1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = width * 3/4 + 60 // 60 : padding 위아래 20 + image 40
        return CGSize(width: width, height: height)
    }
}
