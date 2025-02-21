//
//  SelectTamagotchiPopupViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit

final class SelectTamagotchiPopupViewController: BaseViewController {
        
    private let selectTamagotchiPopupView = SelectTamagotchiPopupView()
    
    override func loadView() {
        view = selectTamagotchiPopupView
    }
    
    override func configureView() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
    }
}
