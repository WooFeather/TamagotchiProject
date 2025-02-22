//
//  SettingTableViewCell.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit
import SnapKit

final class SettingTableViewCell: BaseTableViewCell {
    
    static let id = "SettingTableViewCell"
    
    private let disclosureImageView = UIImageView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override func configureHierarchy() {
        [iconImageView, titleLabel, subtitleLabel, disclosureImageView].forEach {
            addSubview($0)
        }
    }
    
    override func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(21)
        }
        
        disclosureImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
            make.height.equalTo(21)
        }
    }
    
    override func configureView() {
        iconImageView.tintColor = .tpAccent
        iconImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textColor = .tpAccent
        
        subtitleLabel.text = ""
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = .tpAccent
        
        disclosureImageView.image = UIImage(systemName: "chevron.right")
        disclosureImageView.tintColor = .lightGray
        disclosureImageView.contentMode = .scaleAspectFit
    }
}
