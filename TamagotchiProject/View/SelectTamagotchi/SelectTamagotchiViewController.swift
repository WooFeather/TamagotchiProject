//
//  SelectTamagotchiViewController.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit
import RxSwift
import RxCocoa

final class SelectTamagotchiViewController: BaseViewController {

    private let selectTamagotchiView = SelectTamagotchiView()
    private let viewModel = SelectTamagotchiViewModel()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = selectTamagotchiView
    }
    
    override func bind() {
        let input = SelectTamagotchiViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.names
            .bind(to: selectTamagotchiView.tamagotchiCollectionView.rx.items(cellIdentifier: TamagotchiCollectionViewCell.id, cellType: TamagotchiCollectionViewCell.self)) { (item, element, cell) in
                cell.nameLabel.text = element
                cell.imageView.image = ._1_6
            }
            .disposed(by: disposeBag)
    }
    
    override func configureView() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    override func configureData() {
        selectTamagotchiView.tamagotchiCollectionView.register(TamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.id)
    }
}
