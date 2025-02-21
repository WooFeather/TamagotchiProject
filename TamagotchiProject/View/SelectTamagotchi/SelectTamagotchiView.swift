//
//  SelectTamagotchiView.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import SnapKit

final class SelectTamagotchiView: BaseView {

    lazy var tamagotchiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
    override func configureHierarchy() {
        addSubview(tamagotchiCollectionView)
    }
    
    override func configureLayout() {
        tamagotchiCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        tamagotchiCollectionView.backgroundColor = .tpBackground
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionInset: CGFloat = 20
        let cellSpacing: CGFloat = 20
        let lineSpacing: CGFloat = 40
        
        let layout = UICollectionViewFlowLayout()
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (sectionInset * 2) - (cellSpacing * 2)
        
        layout.itemSize = CGSize(width: (cellWidth / 3), height: (cellWidth / 3) * 1.2)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        layout.minimumLineSpacing = lineSpacing
        return layout
    }
}
