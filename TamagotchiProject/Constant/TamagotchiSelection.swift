//
//  TamagotchiSelection.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/23/25.
//

import UIKit

enum TamagotchiSelection: CaseIterable {
    case firstTamagotchi
    case secondTamagotchi
    case thirdTamagotchi
    
    var imageSet: [UIImage] {
        switch self {
        case .firstTamagotchi:
            return [._1_1, ._1_2, ._1_3, ._1_4, ._1_5, ._1_6, ._1_7, ._1_8, ._1_9]
        case .secondTamagotchi:
            return [._2_1, ._2_2, ._2_3, ._2_4, ._2_5, ._2_6, ._2_7, ._2_8, ._2_9]
        case .thirdTamagotchi:
            return [._3_1, ._3_2, ._3_3, ._3_4, ._3_5, ._3_6, ._3_7, ._3_8, ._3_9]
        }
    }
}
