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
    
    // 원본데이터
    private let tamagotchiList = TamagotchiList.allCases
    private let tamagotchiName = Observable.just(UserDefaultsManager.tamagotchiName)
    private var level = UserDefaultsManager.level
    private var riceCount = UserDefaultsManager.riceCount
    private var waterCount = UserDefaultsManager.waterCount
    
    struct Input {
        let settingButtonTapped: ControlEvent<Void>?
    }
    
    struct Output {
        let settingButtonTapped: ControlEvent<Void>?
        let tamagotchiImageData: Observable<Data>
    }
    
    init() {
        print("MainViewModel Init")
    }
    
    deinit {
        print("MainViewModel Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        // 가공데이터
        let imageData = BehaviorSubject(value: Data())
        
        tamagotchiName
            .bind(with: self) { owner, name in
                if name == owner.tamagotchiList[0].name {
                    imageData.onNext(owner.tamagotchiList[0].imageSet[owner.level].pngData() ?? Data())
                } else if name == owner.tamagotchiList[1].name {
                    imageData.onNext(owner.tamagotchiList[1].imageSet[owner.level].pngData() ?? Data())
                } else {
                    imageData.onNext(owner.tamagotchiList[2].imageSet[owner.level].pngData() ?? Data())
                }
            }
            .disposed(by: disposeBag)
        
        return Output(
            settingButtonTapped: input.settingButtonTapped,
            tamagotchiImageData: imageData
        )
    }
}
