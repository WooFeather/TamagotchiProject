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
        
        // 버튼이 눌렸을 때..
        // 1. 텍스트필드의 텍스트를 먼저 판단 -> 공백인지 아닌지
        // 1-1. 공백일 경우 -> output에 들어갈 riceCount에 1을 전달
        // 1-2. 공백이 아닐 경우 해당 텍스트를 Int로 전환했을 때 변환 가능한지 아닌지 판단
        // 2-1. 변환가능하지 않을 경우 -> output에 들어갈 riceCount에 0을 전달
        // 2-2. 변환 가능할 경우 해당 숫자가 100보다 작은지 판단
        // 3-1. 100보다 작을 경우 -> output에 들어갈 riceCount에 해당 값을 전달
        // 3-2. 100보다 클 경우 -> VC에 Alert를 띄울 수 있는 output에 값을 전달
        // TODO: 버블 메세지 변경
        input.riceButtonTapped
            .withLatestFrom(riceText)
            .bind(with: self) { owner, riceText in
                
                let intRice = Int(riceText) ?? 0
                
                if riceText.isEmpty {
                    invalidRice.onNext(false)
                    owner.riceCount += 1
                } else {
                    if intRice > 0 && intRice < 100 {
                        invalidRice.onNext(false)
                        owner.riceCount += intRice
                    } else {
                        invalidRice.onNext(true)
                    }
                }
                
                owner.calculateLevel(outputLevel: level)
                riceCount.onNext(owner.riceCount)
                UserDefaultsManager.riceCount = owner.riceCount
            }
            .disposed(by: disposeBag)
        
        input.waterButtonTapped
            .withLatestFrom(waterText)
            .bind(with: self) { owner, waterText in
                
                let intWater = Int(waterText) ?? 0
                
                if waterText.isEmpty {
                    invalidWater.onNext(false)
                    owner.waterCount += 1
                } else {
                    if intWater > 0 && intWater < 50 {
                        invalidWater.onNext(false)
                        owner.waterCount += intWater
                    } else {
                        invalidWater.onNext(true)
                    }
                }
                
                owner.calculateLevel(outputLevel: level)
                waterCount.onNext(owner.waterCount)
                UserDefaultsManager.waterCount = owner.waterCount
            }
            .disposed(by: disposeBag)
        
        // zip으로 하면 제대로 동작 안함 -> combineLatest로 해결
        Observable.combineLatest(tamagotchiName, level)
            .bind(with: self) { owner, value in
                if value.0 == owner.tamagotchiList[0].name {
                    imageData.onNext(owner.tamagotchiList[0].imageSet[value.1 - 1].pngData() ?? Data())
                } else if value.0 == owner.tamagotchiList[1].name {
                    imageData.onNext(owner.tamagotchiList[1].imageSet[value.1 - 1].pngData() ?? Data())
                } else {
                    imageData.onNext(owner.tamagotchiList[2].imageSet[value.1 - 1].pngData() ?? Data())
                }
            }
            .disposed(by: disposeBag)
        
        return Output(
            settingButtonTapped: input.settingButtonTapped,
            tamagotchiImageData: imageData,
            riceCount: riceCount,
            waterCount: waterCount,
            invalidRice: invalidRice,
            invalidWater: invalidWater
        )
    }
    
    private func calculateLevel(outputLevel: BehaviorSubject<Int>) {
        let score: Double = Double((riceCount / 5) + (waterCount / 2))
        
        switch score {
        case 0.0...19.9:
            level = 1
        case 20.0...29.9:
            level = 2
        case 30.0...39.9:
            level = 3
        case 40.0...49.9:
            level = 4
        case 50.0...59.9:
            level = 5
        case 60.0...69.9:
            level = 6
        case 70.0...79.9:
            level = 7
        case 80.0...89.9:
            level = 8
        case 90.0...99.9:
            level = 9
        default:
            level = 10
        }
            
        print("level:", level)
        outputLevel.onNext(level)
        UserDefaultsManager.level = level
    }
    
    private func randomMessage() {
        // 버블에 랜덤 메세지 보여주기 -> 시점은 메인뷰가 보여질때마다
        print(#function)
    }
}
