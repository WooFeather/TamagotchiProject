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
    
    var names = BehaviorSubject(value: ["따끔따끔 다마고치", "방실방실 다마고치", "반짝반짝 다마고치", "준비중이에요"])
    
    struct Input {
        
    }
    
    struct Output {
        let names: BehaviorSubject<[String]>
    }
    
    func transform(input: Input) -> Output {
        
        return Output(names: names)
    }
}
