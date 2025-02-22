//
//  NicknameSettingView.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/23/25.
//

import UIKit
import SnapKit

final class NicknameSettingView: BaseView {
    
    let nicknameTextField = LineTextField(placeholder: "변경할 닉네임을 입력해주세요", keyBoardType: .default)
    
    override func configureHierarchy() {
        addSubview(nicknameTextField)
    }
    
    override func configureLayout() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
    
    override func configureView() {
        nicknameTextField.textField.textAlignment = .left
    }
}
