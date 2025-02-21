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
        let input = SelectTamagotchiViewModel.Input(
            cellIndex: selectTamagotchiView.tamagotchiCollectionView.rx.itemSelected,
            cellData: selectTamagotchiView.tamagotchiCollectionView.rx.modelSelected(Tamagotchi.self)
        )
        let output = viewModel.transform(input: input)
        
        output.tamagotchiList
            .bind(to: selectTamagotchiView.tamagotchiCollectionView.rx.items(cellIdentifier: TamagotchiCollectionViewCell.id, cellType: TamagotchiCollectionViewCell.self)) { (item, element, cell) in
                cell.imageView.image = element.image
                cell.nameLabel.text = element.name
            }
            .disposed(by: disposeBag)
        
        Observable.zip(output.isValidate, output.tamagotchiData)
            .bind(with: self) { owner, value in
                if value.0 {
                    print(value.1.name)
                }
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
