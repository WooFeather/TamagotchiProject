//
//  PopupViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import RxSwift
import RxCocoa

final class PopupViewController: BaseViewController {
        
    private let disposeBag = DisposeBag()
    private let popupView = PopupView()
    let viewModel = PopupViewModel()
    
    override func loadView() {
        view = popupView
    }
    
    override func bind() {
        let input = PopupViewModel.Input(
            cancelButtonTapped: popupView.cancelButton.rx.tap
        )
        let output = viewModel.transform(input: input)
        
        output.selectedTamagotchi
            .bind(with: self) { owner, value in
                owner.popupView.imageView.image = value.image
                owner.popupView.nameLabel.text = value.name
                owner.popupView.descriptionLabel.text = value.description
            }
            .disposed(by: disposeBag)
        
        output.cancelButtonTapped
            .bind(with: self) { owner, _ in
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        // TODO: ViewModel로 분리
        popupView.startButton.rx.tap
            .bind(with: self) { owner, _ in
                // TODO: UserDefaults에 다마고치 데이터 값전달(저장)
                
                print(UserDefaultsManager.tamagotchi.name)
                
                let vc = MainViewController()
                let nav = UINavigationController(rootViewController: vc)
                owner.changeRootViewController(vc: nav, isSigned: true)
            }
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
    }
}
