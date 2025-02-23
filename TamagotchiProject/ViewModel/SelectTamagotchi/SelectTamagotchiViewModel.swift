//
//  SelectTamagotchiViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SelectTamagotchiViewModel: BaseViewModel {
    
    var disposeBag = DisposeBag()
    
    var tamagotchiList = Observable.just(TamagotchiInfo().tamagotchiList)
    
    struct Input {
        let cellIndex: ControlEvent<IndexPath>
        let cellData: ControlEvent<Tamagotchi>
    }
    
    struct Output {
        let tamagotchiList: Observable<[Tamagotchi]>
        let isValidate: Observable<Bool>
        let tamagotchiData: ControlEvent<Tamagotchi>
    }
    
    init() {
        print("SelectTamagotchiViewModel Init")
    }
    
    deinit {
        print("SelectTamagotchiViewModel Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        let isValidate = input.cellIndex
            .map { value in
                if value.item < 3 {
                    return true
                } else {
                    return false
                }
            }
        
        return Output(
            tamagotchiList: tamagotchiList,
            isValidate: isValidate,
            tamagotchiData: input.cellData
        )
    }
}
