//
//  Tamagotchi.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import UIKit

struct Tamagotchi {
    let image: UIImage
    let name: String
    let description: String
}

final class TamagotchiInfo {
    let tamagotchiList: [Tamagotchi] = [
        Tamagotchi(image: ._1_6, name: "따끔따끔 다마고치", description: "안녕하세유~ 따끔이어유!"),
        Tamagotchi(image: ._2_6, name: "방실방실 다마고치", description: "하이티비 방실티비"),
        Tamagotchi(image: ._3_6, name: "반짝반짝 다마고치", description: "반짝반짝 어쩌구..."),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: ""),
        Tamagotchi(image: .no, name: "준비중이에요", description: "")
    ]
}
