//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
// assignment: donwload sample code below and play with it https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views

class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var infos: [BannerInfo] = BannerInfo.list
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    let colours: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    typealias Item = BannerInfo
    enum Section {
    case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentaion - diffable datasource
        dataSource = UICollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = self.colours[indexPath.item]
            cell.layer.cornerRadius = 16
            return cell
        })
        
        // data - snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(infos, toSection: .main)
        dataSource.apply(snapshot)
        
        // layout - compositional layout
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
        
        pageControl.numberOfPages = infos.count
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // 지금 section의 크기에 맞지 않아서, vertical로 보이는거니깐,
        // >> section에 구애받지 않고 옆으로 보여줘~ 라는 코드
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        // pagecontroller을 위해.. group size와 offset이 필요하다
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
//            print(">> \(Int(floor((offset.x-env.container.contentSize.width) / env.container.contentSize.width) + 2))")
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
