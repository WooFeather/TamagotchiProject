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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 다마고치 선택시 이미지 데이터가 넘어오면 안됨 => 세마리중에 어떤애가 선택됐는지 정보만 넘어오고, 그 친구의 레벨에 맞는 이미지를 띄워야 함
        print(UserDefaultsManager.tamagotchiImageData)
        print(UserDefaultsManager.tamagotchiName)
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func bind() {
        // TODO: ViewModel로 빼기
        navigationItem.rightBarButtonItem?.rx.tap
            .bind(with: self) { owner, _ in
                let vc = SettingViewController()
                owner.navigationController?.pushViewController(vc, animated: true)
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
