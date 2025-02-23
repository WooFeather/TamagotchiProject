//
//  MainView.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    
    private let bubbleImageView = UIImageView()
    private let riceStackView = UIStackView()
    private let waterStackView = UIStackView()
    let bubbleLabel = UILabel()
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameLabel = TamagotchiLabel()
    let statusLabel = UILabel()
    let riceTextField = LineTextField(placeholder: "밥주세용")
    let waterTextField = LineTextField(placeholder: "물주세용")
    let riceButton = FeedButton(title: "밥먹기", imageName: "leaf.circle")
    let waterButton = FeedButton(title: "물먹기", imageName: "drop.circle")
    
    override func configureHierarchy() {
        [bubbleImageView, bubbleLabel, tamagotchiImageView, tamagotchiNameLabel, statusLabel, riceStackView, waterStackView].forEach {
            addSubview($0)
        }
        
        [riceTextField, riceButton].forEach { riceStackView.addArrangedSubview($0) }
        [waterTextField, waterButton].forEach { waterStackView.addArrangedSubview($0) }
    }
    
    override func configureLayout() {
        bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(120)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.center.equalTo(bubbleImageView.snp.center)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        tamagotchiNameLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiNameLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        riceButton.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        
        waterStackView.snp.makeConstraints { make in
            make.top.equalTo(riceStackView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
        }
        
        waterTextField.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        waterButton.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
    }
    
    override func configureView() {
        bubbleImageView.image = .bubble
        bubbleImageView.contentMode = .scaleAspectFill
        
        bubbleLabel.text = "안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이"
        bubbleLabel.textColor = .tpAccent
        bubbleLabel.font = .boldSystemFont(ofSize: 14)
        bubbleLabel.textAlignment = .center
        bubbleLabel.numberOfLines = 0
        
        tamagotchiImageView.contentMode = .scaleAspectFit
        
        tamagotchiNameLabel.text = UserDefaultsManager.tamagotchiName
        
//        statusLabel.text = "LV1 • 밥알 0개 • 물방울 0개"
        statusLabel.font = .boldSystemFont(ofSize: 14)
        statusLabel.textColor = .tpAccent
        
        riceStackView.spacing = 8
        waterStackView.spacing = 8
    }
}
