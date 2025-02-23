//
//  NicknameSettingViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/23/25.
//

import Foundation
import RxSwift
import RxCocoa

final class NicknameSettingViewModel: BaseViewModel {
    var disposeBag = DisposeBag()
    
    var currentNickname = BehaviorSubject(value: "대장")
    
    struct Input {
        let saveButtonTapped: ControlEvent<Void>?
        let newNickname: PublishSubject<String>
    }
    
    struct Output {
        let currentNickname: Observable<String>
        let saveButtonTapped: ControlEvent<Void>?
        let validation: Observable<Bool>
    }
    
    init() {
        print("NicknameSettingViewModel Init")
    }
    
    deinit {
        print("NicknameSettingViewModel Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        let validation = input.newNickname
            .map {
                let trimmingText = $0.trimmingCharacters(in: .whitespaces)
                if trimmingText.count < 2 || trimmingText.count > 6 {
                    return false
                } else {
                    UserDefaultsManager.nickname = trimmingText
                    return true
                }
            }
        
        return Output(
            currentNickname: currentNickname,
            saveButtonTapped: input.saveButtonTapped,
            validation: validation
        )
    }
}
