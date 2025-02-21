//
//  FeedButton.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit

final class FeedButton: UIButton {
    
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        
        setImage(UIImage(systemName: imageName), for: .normal)
        setTitle(title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 15)
        setTitleColor(.tpAccent, for: .normal)
        tintColor = .tpAccent
        layer.borderColor = UIColor.tpAccent.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
