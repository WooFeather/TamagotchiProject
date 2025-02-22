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
            .bind(to: settingView.settingTableView.rx.items(cellIdentifier: "SettingCell", cellType: UITableViewCell.self)) { (row, element, cell) in
                
                cell.textLabel?.text = element.name
                cell.imageView?.image = element.image
                
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = .tpBackground
                cell.tintColor = .tpAccent
                cell.textLabel?.font = .boldSystemFont(ofSize: 14)
                cell.selectionStyle = .none
  
                // TODO: 커스텀셀로 만들어야 할듯
//                if row == 0 {
//                    cell.detailTextLabel?.text = "고래밥"
//                }
            }
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "설정"
    }
    
    override func configureData() {
        settingView.settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCell")
    }
}
