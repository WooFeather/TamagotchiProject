//
//  TamagotchiLabel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit

final class TamagotchiLabel: UILabel {
    private var padding = UIEdgeInsets(top: 10, left: 6, bottom: 10, right: 6)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
    
    init() {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize: 14)
        textColor = .tpAccent
        textAlignment = .center
        layer.borderColor = UIColor.tpAccent.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
