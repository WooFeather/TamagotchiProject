//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit

final class MainViewController: BaseViewController {

    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UserDefaultsManager.tamagotchiImageData)
        print(UserDefaultsManager.tamagotchiName)
    }
    
    override func loadView() {
        view = mainView
    }

    override func configureView() {
        view.backgroundColor = .tpBackground
        navigationItem.title = "대장님의 다마고치"
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(barButtonTapped))
        navigationItem.setRightBarButton(barButtonItem, animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .tpAccent
    }
    
    @objc
    private func barButtonTapped() {
        // TODO: barButtonTap -> 설정화면 액션 ViewModel로 빼기
        print("설정화면으로 이동")
    }
}
