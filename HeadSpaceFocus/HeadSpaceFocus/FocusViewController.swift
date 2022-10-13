//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 2022/10/12.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    // button>> type: system, style: default
    
    var focusInfos: [Focus] = Focus.list
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // 현재 추천을 보여주고 있는지 아닌지
    var curated: Bool = false
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10

        // Presentation - differ data source
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCollectionViewCell", for: indexPath) as? FocusCollectionViewCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data - snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusInfos, toSection: .main)
        dataSource.apply(snapshot)
        
        // layout - compositional layout
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        // size: group == item
        // .estimated : 기본적으로 50정도 높이를 예상하는데, content에 따라서 변경 될 수 있다. >> 동적으로 만들어주는 요소
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()

        self.focusInfos = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusInfos, toSection: .main)
        dataSource.apply(snapshot)
        
        updateButtonTitle()
    }
}
