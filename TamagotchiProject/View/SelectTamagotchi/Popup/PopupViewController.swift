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
        
    let disposeBag = DisposeBag()
    let viewModel = PopupViewModel()
    private let popupView = PopupView()
    
    override func loadView() {
        view = popupView
    }
    
    override func bind() {
        let input = PopupViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.imageContents
            .bind(with: self) { owner, imageData in
                owner.popupView.imageView.image = UIImage(data: imageData)
            }
            .disposed(by: disposeBag)
        
        output.nameContents
            .bind(to: popupView.nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.descriptionContents
            .bind(to: popupView.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
    }
}
