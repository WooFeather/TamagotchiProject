//
//  SettingViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SettingViewModel: BaseViewModel {
    
    var disposeBag = DisposeBag()
    var settingList = Observable.just(SettingList.allCases)
    
    struct Input {
        let cellTapped: ControlEvent<IndexPath>
    }
    
    struct Output {
        let settingList: Observable<[SettingList]>
        let cellTapped: ControlEvent<IndexPath>
    }
    
    func transform(input: Input) -> Output {
        
        return Output(
            settingList: settingList,
            cellTapped: input.cellTapped
        )
    }
}
