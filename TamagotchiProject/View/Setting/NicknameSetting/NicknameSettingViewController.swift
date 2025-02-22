//
//  NicknameSettingViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/23/25.
//

import UIKit
import RxSwift
import RxCocoa

final class NicknameSettingViewController: BaseViewController {

    private let nicknameSettingView = NicknameSettingView()
    private let disposeBag = DisposeBag()
    let viewModel = NicknameSettingViewModel()
    
    override func loadView() {
        view = nicknameSettingView
    }
    
    override func bind() {
        let newNickname = PublishSubject<String>()
        
        let input = NicknameSettingViewModel.Input(
            saveButtonTapped: navigationItem.rightBarButtonItem?.rx.tap,
            newNickname: newNickname
        )
        let output = viewModel.transform(input: input)
        
        output.currentNickname
            .bind(with: self) { owner, nickname in
                owner.nicknameSettingView.nicknameTextField.textField.text = nickname
            }
            .disposed(by: disposeBag)
        
        output.saveButtonTapped!
            .bind(with: self) { owner, _ in
                newNickname.onNext(owner.nicknameSettingView.nicknameTextField.textField.text ?? "")
            }
            .disposed(by: disposeBag)
        
        // TODO: 뒤로갔을 때 MainView, SettingView에 닉네임 바로 반영X => NotificationCenter써야할듯?
        output.validation
            .bind(with: self) { owner, validate in
                if validate {
                    owner.navigationController?.popViewController(animated: true)
                } else {
                    owner.showAlert(title: "저장실패!", message: "닉네임은 2글자 이상 6글자 이하여야 합니다.", button: "확인") {
                        owner.dismiss(animated: true)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "대장님 이름 정하기"
        let barButtonItem = UIBarButtonItem(title: "저장")
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}
