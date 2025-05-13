//
//  LoginResponseModel.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import Foundation

struct LoginResponseWrapper: Codable {
    var success: Bool
    var code: String
    var message: String
    var data: LoginResponseModel
}

struct LoginResponseModel: Codable {
    let userId: Int
}
