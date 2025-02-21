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
        let selectedImageData = PublishSubject<Data>()
        let selectedName = PublishSubject<String>()
        
        let input = PopupViewModel.Input(
            cancelButtonTapped: popupView.cancelButton.rx.tap,
            startButtonTapped: popupView.startButton.rx.tap,
            selectedImageData: selectedImageData,
            selectedName: selectedName
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
        
        output.startButtonTapped
            .bind(with: self) { owner, _ in
                selectedImageData.onNext(owner.popupView.imageView.image?.pngData() ?? Data())
                selectedName.onNext(owner.popupView.nameLabel.text ?? "")
                
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
