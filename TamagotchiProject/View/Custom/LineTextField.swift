//
//  LineTextField.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit
import SnapKit

final class LineTextField: UIView {
    let textField = UITextField()
    private let underLine = UIView()
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureView(placeholder)
    }
    
    private func configureHierarchy() {
        addSubview(textField)
        addSubview(underLine)
    }
    
    private func configureLayout() {
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        underLine.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(textField)
            make.height.equalTo(1)
        }
    }
    
    private func configureView(_ placeholder: String) {
        textField.borderStyle = .none
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .tpAccent
        textField.keyboardType = .decimalPad
        
        underLine.backgroundColor = .tpAccent
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
