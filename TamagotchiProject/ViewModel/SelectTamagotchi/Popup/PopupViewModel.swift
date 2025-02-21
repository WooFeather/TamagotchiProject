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
    }
    
    struct Output {
        let selectedTamagotchi: Observable<Tamagotchi>
        let cancelButtonTapped: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        
        return Output(
            selectedTamagotchi: selectedTamagotchi,
            cancelButtonTapped: input.cancelButtonTapped
        )
    }
}
