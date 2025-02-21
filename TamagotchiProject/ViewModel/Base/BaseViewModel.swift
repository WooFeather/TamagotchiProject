//
//  BaseViewModel.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import Foundation
import RxSwift
import RxCocoa

protocol BaseViewModel {
    var disposeBag: DisposeBag { get }
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
