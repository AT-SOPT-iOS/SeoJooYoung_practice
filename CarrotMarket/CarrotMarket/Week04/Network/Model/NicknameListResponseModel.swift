//
//  NicknameListResponseModel.swift
//  CarrotMarket
//
//  Created by seozero on 5/8/25.
//

struct NicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}

struct NicknamePatchResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: String?
}
