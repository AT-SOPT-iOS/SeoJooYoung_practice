//
//  RegisterRequestModel.swift
//  CarrotMarket
//
//  Created by seozero on 5/8/25.
//

import Foundation

struct RegisterRequestModel: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
