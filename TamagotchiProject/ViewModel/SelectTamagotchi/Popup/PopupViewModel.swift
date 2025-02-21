//
//  PopupViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import Foundation
import RxSwift
import RxCocoa

final class PopupViewModel: BaseViewModel {
    var disposeBag = DisposeBag()
    
    var selectedTamagotchi = BehaviorSubject(value: Tamagotchi(image: ._1_1, name: "", description: ""))
    
    struct Input {
        let cancelButtonTapped: ControlEvent<Void>
        let startButtonTapped: ControlEvent<Void>
        let selectedImageData: PublishSubject<Data>
        let selectedName: PublishSubject<String>
    }
    
    struct Output {
        let selectedTamagotchi: Observable<Tamagotchi>
        let cancelButtonTapped: ControlEvent<Void>
        let startButtonTapped: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        Observable.zip(input.selectedImageData, input.selectedName)
            .bind(with: self) { owner, value in
                UserDefaultsManager.tamagotchiImageData = value.0
                UserDefaultsManager.tamagotchiName = value.1
            }
            .disposed(by: disposeBag)
        
        return Output(
            selectedTamagotchi: selectedTamagotchi,
            cancelButtonTapped: input.cancelButtonTapped,
            startButtonTapped: input.startButtonTapped
        )
    }
}
