//
//  SelectTamagotchiPopupView.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import SnapKit

class SelectTamagotchiPopupView: BaseView {

    private let backgroundView = UIView()
    private let dividerView = UIView()
    private let buttonDividerView = UIView()
    private let buttonStackView = UIStackView()
    let imageView = UIImageView()
    let nameLabel = TamagotchiLabel()
    let descriptionLabel = UILabel()
    let cancelButton = UIButton()
    let startButton = UIButton()
    
    override func configureHierarchy() {
        addSubview(backgroundView)
        [imageView, nameLabel, dividerView, descriptionLabel, buttonDividerView, buttonStackView].forEach {
            backgroundView.addSubview($0)
        }
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(startButton)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(30)
            make.verticalEdges.equalTo(safeAreaLayoutGuide).inset(160)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(140)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        
        buttonDividerView.snp.makeConstraints { make in
            make.bottom.equalTo(buttonStackView.snp.top)
            make.height.equalTo(0.5)
            make.horizontalEdges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    override func configureView() {
        backgroundView.backgroundColor = .tpBackground
        backgroundView.layer.cornerRadius = 8
        
        imageView.image = ._1_6
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.text = "테스트임 다마고치"
        
        dividerView.backgroundColor = .tpAccent
        
        descriptionLabel.text = "안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이 안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이 안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이 안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이 "
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .tpAccent
        descriptionLabel.numberOfLines = 0
        
        buttonDividerView.backgroundColor = .tpAccent
        
        buttonStackView.distribution = .fillEqually
        buttonStackView.layer.cornerRadius = 8
        buttonStackView.clipsToBounds = true
        buttonStackView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        cancelButton.backgroundColor = .tpBackgroundSecondary
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.tpAccent, for: .normal)
        
        startButton.backgroundColor = .tpBackground
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.tpAccent, for: .normal)
    }
}
