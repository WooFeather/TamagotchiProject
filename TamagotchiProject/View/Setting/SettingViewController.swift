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
        let input = SettingViewModel.Input(cellTapped: settingView.settingTableView.rx.itemSelected)
        let output = viewModel.transform(input: input)
        
        output.settingList
            .bind(to: settingView.settingTableView.rx.items(cellIdentifier: SettingTableViewCell.id, cellType: SettingTableViewCell.self)) { (row, element, cell) in
                
                cell.titleLabel.text = element.name
                cell.iconImageView.image = element.image
                cell.backgroundColor = .tpBackground
                cell.selectionStyle = .none
                
                if row == 0 {
                    cell.subtitleLabel.text = UserDefaultsManager.nickname
                }
            }
            .disposed(by: disposeBag)
        
        output.cellTapped
            .bind(with: self) { owner, indexPath in
                if indexPath.row == 0 {
                    let vc = NicknameSettingViewController()
                    vc.viewModel.currentNickname.onNext(UserDefaultsManager.nickname)
                    owner.navigationController?.pushViewController(vc, animated: true)
                } else if indexPath.row == 1 {
                    let vc = SelectTamagotchiViewController()
                    owner.navigationController?.pushViewController(vc, animated: true)
                } else {
                    owner.showAlert(title: "데이터 초기화", message: "지금까지의 데이터를 초기화하고 처음부터 다시 시작하시겠어요?", button: "초기화하기", isCancelButton: true) {
                        for key in UserDefaults.standard.dictionaryRepresentation().keys {
                            UserDefaults.standard.removeObject(forKey: key.description)
                        }
                        let vc = SelectTamagotchiViewController()
                        let nav = UINavigationController(rootViewController: vc)
                        owner.changeRootViewController(vc: nav, isSigned: false)
                    }
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
