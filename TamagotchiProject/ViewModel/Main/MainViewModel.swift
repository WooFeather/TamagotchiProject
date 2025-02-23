//
//  MainViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: BaseViewModel {
    
    var disposeBag = DisposeBag()
    
    struct Input {
        let settingButtonTapped: ControlEvent<Void>?
    }
    
    struct Output {
        let settingButtonTapped: ControlEvent<Void>?
    }
    
    init() {
        print("MainViewModel Init")
    }
    
    deinit {
        print("MainViewModel Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        return Output(settingButtonTapped: input.settingButtonTapped)
    }
}
