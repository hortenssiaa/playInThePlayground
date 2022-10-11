//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by Hakyung Sohn on 2022/10/11.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    let messageList: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionview.dataSource = self
        collectionview.delegate = self
        
        let flowlayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout
        flowlayout?.estimatedItemSize = .zero
        
        pagecontrol.numberOfPages = messageList.count
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let message = messageList[indexPath.item]
        cell.configure(message)
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
//        return CGSize(width: width, height: height)
        return collectionView.bounds.size
        // size 라는 property안에 width, height가 모두 포함되어있음
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    // UIScrollViewDelegate 를 통해 현재 scroll되고있는 상황 파악 가능
    //func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // view가 offset된만큼의 x, y축 위치를 보여줌
    //    print(scrollView.contentOffset)
    //    print(Int(scrollView.contentOffset.x / self.collectionview.bounds.width))
    //}
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pagecontrol.currentPage = Int(scrollView.contentOffset.x / self.collectionview.bounds.width)
    }
}
