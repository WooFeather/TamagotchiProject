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
        Tamagotchi(image: ._1_6, name: "따끔따끔 다마고치", description: "안녕! 나는 따끔따끔 다마고치야. 선인장처럼 생겼지만 마음만은 따뜻하다고! 조용하고 든든한 친구가 되고 싶다면, 나랑 함께 하자!"),
        Tamagotchi(image: ._2_6, name: "방실방실 다마고치", description: "안녕하세요! 저는 방실방실 다마고치예요! 해처럼 빛나고, 언제나 웃고 있죠! 언제든 따뜻한 위로가 필요하면, 저를 불러 주세요!"),
        Tamagotchi(image: ._3_6, name: "반짝반짝 다마고치", description: "반짝반짝! 나는 작은 별 반짝반짝 다마고치야! 조용한 밤하늘처럼 차분한 시간을 보내고 싶다면, 나를 키워봐!"),
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
