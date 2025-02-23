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
    private let level = UserDefaultsManager.level
    private var riceCount = UserDefaultsManager.riceCount
    private var waterCount = UserDefaultsManager.waterCount
    
    struct Input {
        let settingButtonTapped: ControlEvent<Void>?
        let riceButtonTapped: ControlEvent<Void>
        let waterButtonTapped: ControlEvent<Void>
        let riceText: ControlProperty<String>
        let waterText: ControlProperty<String>
    }
    
    struct Output {
        let settingButtonTapped: ControlEvent<Void>?
        let tamagotchiImageData: Observable<Data>
        let riceCount: Observable<Int>
        let waterCount: Observable<Int>
        let invalidRice: Observable<Bool>
        let invalidWater: Observable<Bool>
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
        let level = BehaviorSubject(value: level)
        let riceCount = BehaviorSubject(value: riceCount)
        let waterCount = BehaviorSubject(value: waterCount)
        let invalidRice = BehaviorSubject(value: false)
        let invalidWater = BehaviorSubject(value: false)
        
        let riceText = input.riceText
            .map { $0.trimmingCharacters(in: .whitespaces) }
        
        let waterText = input.waterText
            .map { $0.trimmingCharacters(in: .whitespaces) }
        
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
        
        // 버튼이 눌렸을 때..
        // 1. 텍스트필드의 텍스트를 먼저 판단 -> 공백인지 아닌지
        // 1-1. 공백일 경우 -> output에 들어갈 riceCount에 1을 전달
        // 1-2. 공백이 아닐 경우 해당 텍스트를 Int로 전환했을 때 변환 가능한지 아닌지 판단
        // 2-1. 변환가능하지 않을 경우 -> output에 들어갈 riceCount에 0을 전달
        // 2-2. 변환 가능할 경우 해당 숫자가 100보다 작은지 판단
        // 3-1. 100보다 작을 경우 -> output에 들어갈 riceCount에 해당 값을 전달
        // 3-2. 100보다 클 경우 -> VC에 Alert를 띄울 수 있는 output에 값을 전달
//        input.riceButtonTapped
//            .withLatestFrom(riceText)
//            .bind(with: self) { owner, riceText in
//                let intRiceText = Int(riceText)
//                
//                // 공백일 때
//                if riceText.isEmpty {
//                    print("밥알 공백")
//                    invalidRice.onNext(false)
//                    owner.riceCount += 1
//                    riceCount.onNext(owner.riceCount)
//                    UserDefaultsManager.riceCount = owner.riceCount
//                } else {
//                    // Int로 변환하는 과정
//                    if intRiceText ?? 0 < 100 {
//                        print("밥알 괜춘")
//                        invalidRice.onNext(false)
//                        owner.riceCount += intRiceText ?? 0
//                        riceCount.onNext(owner.riceCount)
//                        UserDefaultsManager.riceCount = owner.riceCount
//                    } else {
//                        print("밥알 숫자로 못바꾸거나 100이상")
//                        invalidRice.onNext(true)
//                    }
//                }
//            }
//            .disposed(by: disposeBag)
        
        input.riceButtonTapped
            .withLatestFrom(riceText)
            .bind(with: self) { owner, riceText in
                if riceText.isEmpty {
                    owner.riceCount += 1
                    riceCount.onNext(owner.riceCount)
                    UserDefaultsManager.riceCount = owner.riceCount
                } else {
                    owner.riceCount += (Int(riceText) ?? 0)
                    riceCount.onNext(owner.riceCount)
                    UserDefaultsManager.riceCount = owner.riceCount
                }
            }
            .disposed(by: disposeBag)
        
        input.waterButtonTapped
            .withLatestFrom(waterText)
            .bind(with: self) { owner, waterText in
                if waterText.isEmpty {
                    owner.waterCount += 1
                    waterCount.onNext(owner.waterCount)
                    UserDefaultsManager.waterCount = owner.waterCount
                } else {
                    owner.waterCount += (Int(waterText) ?? 0)
                    waterCount.onNext(owner.waterCount)
                    UserDefaultsManager.waterCount = owner.waterCount
                }
            }
            .disposed(by: disposeBag)
        
//        input.waterButtonTapped
//            .withLatestFrom(waterText)
//            .bind(with: self) { owner, waterText in
//                let intWaterText = Int(waterText)
//                
//                if waterText.isEmpty {
//                    print("물방울 공백")
//                    invalidWater.onNext(false)
//                    owner.waterCount += 1
//                    waterCount.onNext(owner.waterCount)
//                    UserDefaultsManager.waterCount = owner.waterCount
//                } else {
//                    if intWaterText ?? 0 < 50 {
//                        print("물방울 괜춘")
//                        invalidWater.onNext(false)
//                        owner.waterCount += intWaterText ?? 0
//                        riceCount.onNext(owner.waterCount)
//                        UserDefaultsManager.waterCount = owner.waterCount
//                    } else {
//                        print("물방울 숫자로 못바꾸거나 50이상")
//                        invalidWater.onNext(true)
//                    }
//                }
//            }
//            .disposed(by: disposeBag)
        
        return Output(
            settingButtonTapped: input.settingButtonTapped,
            tamagotchiImageData: imageData,
            riceCount: riceCount,
            waterCount: waterCount,
            invalidRice: invalidRice,
            invalidWater: invalidWater
        )
    }
    
    private func randomMessage() {
        // 버블에 랜덤 메세지 보여주기 -> 시점은 메인뷰가 보여질때마다
        print(#function)
    }
}
