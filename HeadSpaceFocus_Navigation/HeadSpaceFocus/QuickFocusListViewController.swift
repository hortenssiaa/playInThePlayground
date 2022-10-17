//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 2022/10/17.
//

import UIKit

class QuickFocusListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let breathingList: [QuickFocus] = QuickFocus.breathing
    let walkingList: [QuickFocus] = QuickFocus.walking
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // CaseIterable : Section에 포함된 cases을 다 가져오고 싶을때, 배열형태로 갖고올 수 있음
    // ex) Section.allCases (== let allCases: [Section] = [.breathing, .walking])
    enum Section: CaseIterable {
        case breathe
        case walking
        
        var title: String {
            switch self {
            case .breathe: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    
    typealias Item = QuickFocus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentation - diffable datasource
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuickFocusHeaderView", for: indexPath) as? QuickFocusHeaderView else {
                return nil
            }
            
            let allSections = Section.allCases
            let section = allSections[indexPath.section] // 몇번째 있는 Section이냐
            header.configure(section.title)
            return header
        }
        
        // data - snapshot
        // [Section [.item]] [Section [.item]]
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases) // [.breathe, .walking]
        snapshot.appendItems(breathingList, toSection: .breathe )
        snapshot.appendItems(walkingList, toSection: .walking)
        dataSource.apply(snapshot)
        
        // layout - compositional layout
        collectionView.collectionViewLayout = layout()
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
        section.interGroupSpacing = 20
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
