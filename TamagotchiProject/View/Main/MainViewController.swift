//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: BaseViewController {

    private let mainView = MainView()
    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 메인뷰가 보일때마가 bubble의 메세지 변경하기
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func bind() {
        let input = MainViewModel.Input(
            settingButtonTapped: navigationItem.rightBarButtonItem?.rx.tap,
            riceButtonTapped: mainView.riceButton.rx.tap,
            waterButtonTapped: mainView.waterButton.rx.tap,
            riceText: mainView.riceTextField.textField.rx.text.orEmpty,
            waterText: mainView.waterTextField.textField.rx.text.orEmpty
        )
        let output = viewModel.transform(input: input)
        
        output.settingButtonTapped!
            .bind(with: self) { owner, _ in
                let vc = SettingViewController()
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        output.tamagotchiImageData
            .bind(with: self) { owner, data in
                owner.mainView.tamagotchiImageView.image = UIImage(data: data)
            }
            .disposed(by: disposeBag)
        
        output.riceCount
            .bind(with: self) { owner, value in
                // TODO: bubble의 메세지 바꾸기
                // TODO: 텍스트필드에 아무것도 없었다면 riceCount 올리기 -> statusLabel에 반영
                // TODO: 텍스트필드에 텍스트가 있다면, 한번에 99개까지만 먹을 수 있고, 그 이상 먹으면 alert띄우기
                // TODO: 레벨 계산 및 다마고치 이미지 반영
                print("riceCount:", value)
                owner.mainView.riceTextField.textField.text = ""
            }
            .disposed(by: disposeBag)
        
        output.waterCount
            .bind(with: self) { owner, value in
                // TODO: bubble의 메세지 바꾸기
                // TODO: 텍스트필드에 아무것도 없었다면 waterCount 올리기 -> statusLabel에 반영
                // TODO: 텍스트필드에 텍스트가 있다면, 한번에 49개까지만 먹을 수 있고, 그 이상 먹으면 alert띄우기
                // TODO: 레벨 계산 및 다마고치 이미지 반영
                print("waterCount:", value)
                owner.mainView.riceTextField.textField.text = ""
            }
            .disposed(by: disposeBag)
        
    }

    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "\(UserDefaultsManager.nickname)님의 다마고치"
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"))
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}
