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
        view.backgroundColor = .brown
        navigationItem.title = "대장님의 다마고치"
    }
}
