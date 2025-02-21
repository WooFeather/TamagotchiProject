//
//  TamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import SnapKit

final class TamagotchiCollectionViewCell: BaseCollectionViewCell {
    
    static let id = "TamagotchiCollectionViewCell"
    
    let imageView = UIImageView()
    let nameLabel = TamagotchiLabel()
    
    override func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    }
    
    override func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).offset(-8)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageView.snp.centerX)
            make.bottom.equalToSuperview()
            make.height.equalTo(28)
        }
    }
    
    override func configureView() {
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.text = "테스트임 다마고치"
    }
}
