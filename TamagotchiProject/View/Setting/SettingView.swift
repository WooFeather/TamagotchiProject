//
//  SettingView.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit
import SnapKit

final class SettingView: BaseView {

    let settingTableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(settingTableView)
    }
    
    override func configureLayout() {
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        settingTableView.backgroundColor = .tpBackground
    }
}
