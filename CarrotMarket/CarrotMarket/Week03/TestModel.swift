//
//  TestModel.swift
//  CarrotMarket
//
//  Created by seozero on 4/26/25.
//

import UIKit

// MARK: - Chat Model

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .차은우, name: "김가현", place: "광진구", message: "내말에답장해줘", itemImg: .product1),
            ChatModel(profileImg: .마크, name: "김현수", place: "여의도", message: "마크내사랑", itemImg: .product2),
            ChatModel(profileImg: .마크씨, name: "서주영", place: "잠실", message: "마크내꺼", itemImg: .product3),
            ChatModel(profileImg: .카리나, name: "권석기", place: "회기", message: "나는 민경훈", itemImg: .product4),
            ChatModel(profileImg: .차은우, name: "김나연", place: "미국", message: "타코팔러가야돼", itemImg: .product5),
            ChatModel(profileImg: .마크, name: "정정욱", place: "중국", message: "보쌈정식13000원", itemImg: .product6),
            ChatModel(profileImg: .마크씨, name: "서상원", place: "일본", message: "잠실의주인은두산이다", itemImg: .product7),
            ChatModel(profileImg: .카리나, name: "임재현", place: "태국", message: "뒷풀이갈게", itemImg: .product8),
            ChatModel(profileImg: .차은우, name: "이은지", place: "명왕성", message: "은지야술먹자", itemImg: .product9),
            ChatModel(profileImg: .마크, name: "성현주", place: "안드로메다", message: "응애~", itemImg: .product2),
            ChatModel(profileImg: .마크씨, name: "김한열", place: "뭘보슈", message: "생일추카해한열오빠", itemImg: .product1)
        ]
    }
}

// MARK: - Item Model

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .product1, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product2, name: "오쏘몰", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product3, name: "애플워치", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .product4, name: "가방", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .product5, name: "헤드셋", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .product6, name: "틴트", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product7, name: "카메라", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product8, name: "로션", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "락스", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product4, name: "가방", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product5, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product6, name: "틴트", price: "5000", heartIsSelected: false)
        ]
    }
}
