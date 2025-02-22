//
//  SettingList.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/22/25.
//

import UIKit

enum SettingList: CaseIterable {
    case setNickname
    case changeTamagotchi
    case dataReset
    
    var name: String {
        switch self {
        case .setNickname:
            return "내 이름 설정하기"
        case .changeTamagotchi:
            return "다마고치 변경하기"
        case .dataReset:
            return "데이터 초기화"
        }
    }
    
    var image: UIImage {
        switch self {
        case .setNickname:
            return UIImage(systemName: "pencil") ?? UIImage()
        case .changeTamagotchi:
            return UIImage(systemName: "moon.fill") ?? UIImage()
        case .dataReset:
            return UIImage(systemName: "arrow.trianglehead.clockwise")  ?? UIImage()
        }
    }
}
