//
//  ChatListViewController.swift
//  ChatList
//
//  Created by Hakyung Sohn on 2022/06/06.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data, Presentaion, Layout

        collectionView.dataSource = self
        collectionView.delegate = self
        
        // collectionView는 data, presentation에 대한 정보를 갖기 원하는데
        // collectionView.dataSource = self 이므로, collectionView는 ChatListViewController로부터 정보를 받기를 원해 (선언)
        // 선언을 했고, 실제로 실행을 시키는 코드는
        // -> extension ChatListViewController: UICollectionViewDataSource 에서 메소드들을 통해서
        // ChatListViewController는 UICollectionViewDataSource의 규칙을 따른다
        
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
            // 여러개의 chat셀이 있으면, chat1 chat2 chat3 ...
            // 두개씩 앞뒤로 비교해서 sorting해가는 것
            // 알고리즘을 구현하기보다는, 알고리즘에 적용되는 기준을 sorted()에 제공
        })
    }
}

// dataSource, delegate : protocol임
// 따라서, 정의해 놓은 약속이 있는데, 약속을 준수해 줘야함(confirming) == 실제로 구현을 해워야 한다는 것이, 준수한다는 말
// -> dataSource, delegate을 사용하기 위해서는, self(ChatListViewController)가 알려준다고 했기 때문에, ChatListViewController에 약속을 준수해줘야 하는 것임
// -> 따라서, ChatListViewController: UICollectionViewDataSource, ChatListViewController: UICollectionViewDelegateFlowLayout 이렇게 confirming해주는 것임
extension ChatListViewController: UICollectionViewDataSource {
    
    // Data
    // Collection view에 표현되는 아이템의 개수는 몇기?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    // Presentation
    // cell을 어떻게 표현할지, 정의해서 알려줘야돼
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            // as? 로 casting알때는, optional하게 캐스팅이 안될수도 있는 상황이 있으니 else 포함시킨 것
            return UICollectionViewCell()
        }
        // data
        // chatList에서 해당하는 indexpath를 갖고오고, 그 index에 있는 아이템들
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
    
    
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
        // 여기서 정한 사이즈대로 적용하려면, Estimate size : Automatic -> None
    }
}
