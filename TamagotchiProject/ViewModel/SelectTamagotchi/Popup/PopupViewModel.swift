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
    
    var imageContents = BehaviorSubject(value: Data())
    var nameContents = BehaviorSubject(value: "")
    var descriptionContents = BehaviorSubject(value: "")
    
    struct Input {
        
    }
    
    struct Output {
        let imageContents: Observable<Data>
        let nameContents: Observable<String>
        let descriptionContents: Observable<String>
    }
    
    func transform(input: Input) -> Output {
        
        
        return Output(
            imageContents: imageContents,
            nameContents: nameContents,
            descriptionContents: descriptionContents
        )
    }
}
