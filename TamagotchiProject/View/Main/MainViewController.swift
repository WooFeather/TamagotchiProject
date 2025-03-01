//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import RxSwift
import RxCocoa
import RxAppState

final class MainViewController: BaseViewController {

    private let mainView = MainView()
    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel()
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        // TODO: 메인뷰가 보일때마가 bubble의 메세지 변경하기
//        viewDidAppearBind()
//    }
    
    override func loadView() {
        view = mainView
    }
    
    override func bind() {
        let input = MainViewModel.Input(
            settingButtonTapped: navigationItem.rightBarButtonItem?.rx.tap,
            riceButtonTapped: mainView.riceButton.rx.tap,
            waterButtonTapped: mainView.waterButton.rx.tap,
            riceText: mainView.riceTextField.textField.rx.text.orEmpty,
            waterText: mainView.waterTextField.textField.rx.text.orEmpty,
            viewDidAppear: rx.viewDidAppear
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
        
        // 이렇게 zip으로 묶으면 제대로 동작을 안함 => combineLatest로 해결
        Observable.combineLatest(output.riceCount, output.waterCount)
            .bind(with: self) { owner, value in
                print("riceCount:", value.0, "waterCount:", value.1)
                owner.mainView.statusLabel.text = "LV\(UserDefaultsManager.level) • 밥알 \(value.0)개 • 물방울 \(value.1)개"
                owner.mainView.riceTextField.textField.text = ""
                owner.mainView.waterTextField.textField.text = ""
            }
            .disposed(by: disposeBag)
        
        output.invalidRice
            .bind(with: self) { owner, isInvalid in
                if isInvalid {
                    owner.showAlert(title: "밥주기 실패!", message: "밥은 한번에 99개까지만 먹을 수 있습니다.", button: "확인") {
                        owner.dismiss(animated: true)
                    }
                } else {
                    return
                }
            }
            .disposed(by: disposeBag)
        
        output.invalidWater
            .bind(with: self) { owner, isInvalid in
                if isInvalid {
                    owner.showAlert(title: "물주기 실패!", message: "물은 한번에 49개까지만 먹을 수 있습니다.", button: "확인") {
                        owner.dismiss(animated: true)
                    }
                } else {
                    return
                }
            }
            .disposed(by: disposeBag)
        
        output.bubbleMessage
            .bind(to: mainView.bubbleLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.viewDidAppear
            .drive(with: self) { owner, _ in
                owner.navigationItem.title = "\(UserDefaultsManager.nickname)님의 다마고치"
            }
            .disposed(by: disposeBag)
    }
    
    // mainView가 보일때마다 bubbleMessage를 변경해줘야 해서 이런 방식을 택했는데... 과연 좋은 방법일지
    // => 결과가 두배로 나옴 별로 좋지 않은 방법인듯
//    private func viewDidAppearBind() {
//        let input = MainViewModel.Input(
//            settingButtonTapped: navigationItem.rightBarButtonItem?.rx.tap,
//            riceButtonTapped: mainView.riceButton.rx.tap,
//            waterButtonTapped: mainView.waterButton.rx.tap,
//            riceText: mainView.riceTextField.textField.rx.text.orEmpty,
//            waterText: mainView.waterTextField.textField.rx.text.orEmpty
//        )
//        let output = viewModel.transform(input: input)
//        
//        output.bubbleMessage
//            .bind(to: mainView.bubbleLabel.rx.text)
//            .disposed(by: disposeBag)
//    }

    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "\(UserDefaultsManager.nickname)님의 다마고치"
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"))
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}
