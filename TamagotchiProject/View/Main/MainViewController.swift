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
    
    // TODO: ViewModel로 빼기
    let tamagotchiImageList = TamagotchiSelection.allCases
    var level = UserDefaultsManager.level
    var riceCount = UserDefaultsManager.riceCount
    var waterCount = UserDefaultsManager.waterCount
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: ViewModel로 빼기
        if UserDefaultsManager.tamagotchiName == "따끔따끔 다마고치" {
            mainView.tamagotchiImageView.image = tamagotchiImageList[0].imageSet[level]
        } else if UserDefaultsManager.tamagotchiName == "방실방실 다마고치" {
            mainView.tamagotchiImageView.image = tamagotchiImageList[1].imageSet[level]
        } else {
            mainView.tamagotchiImageView.image = tamagotchiImageList[2].imageSet[level]
        }
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func bind() {
        let input = MainViewModel.Input(settingButtonTapped: navigationItem.rightBarButtonItem?.rx.tap)
        let output = viewModel.transform(input: input)
        
        output.settingButtonTapped!
            .bind(with: self) { owner, _ in
                let vc = SettingViewController()
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        // TODO: ViewModel로 빼기
        mainView.riceButton.rx.tap
            .bind(with: self) { owner, _ in
                // TODO: bubble의 메세지 바꾸기
                // TODO: 텍스트필드에 아무것도 없었다면 riceCount 올리기 -> statusLabel에 반영
                // TODO: 텍스트필드에 텍스트가 있다면, 한번에 99개까지만 먹을 수 있고, 그 이상 먹으면 alert띄우기
                // TODO: 레벨 계산 및 다마고치 이미지 반영
            }
            .disposed(by: disposeBag)
        
        // TODO: ViewModel로 빼기
        mainView.waterButton.rx.tap
            .bind(with: self) { owner, _ in
                // TODO: bubble의 메세지 바꾸기
                // TODO: 텍스트필드에 아무것도 없었다면 waterCount 올리기 -> statusLabel에 반영
                // TODO: 텍스트필드에 텍스트가 있다면, 한번에 49개까지만 먹을 수 있고, 그 이상 먹으면 alert띄우기
                // TODO: 레벨 계산 및 다마고치 이미지 반영
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
