//
//  RegisterResponseModel.swift
//  CarrotMarket
//
//  Created by seozero on 5/8/25.
//

import Foundation

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseModel
}

struct RegisterResponseModel: Codable {
    let userId: Int
    let nickname: String
}
