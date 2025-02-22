//
//  SettingViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit
import RxSwift
import RxCocoa

final class SettingViewController: BaseViewController {
    
    private let settingView = SettingView()
    private let disposeBag = DisposeBag()
    let viewModel = SettingViewModel()
    
    override func loadView() {
        view = settingView
    }
    
    override func bind() {
        let input = SettingViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.settingList
            .bind(to: settingView.settingTableView.rx.items(cellIdentifier: SettingTableViewCell.id, cellType: SettingTableViewCell.self)) { (row, element, cell) in
                
                cell.titleLabel.text = element.name
                cell.iconImageView.image = element.image
                cell.backgroundColor = .tpBackground
                cell.selectionStyle = .none
                
                if row == 0 {
                    // TODO: UserDefaults에 저장된 닉네임으로 교체 예정
                    cell.subtitleLabel.text = "고래밥"
                }
            }
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "설정"
    }
    
    override func configureData() {
        settingView.settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.id)
    }
}
