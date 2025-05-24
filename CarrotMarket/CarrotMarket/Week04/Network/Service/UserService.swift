//
//  UserService.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import UIKit

final class UserService {
    
    static let shared = UserService()
    private init() {}
    
    // MARK: - Request Body 생성
    func makeRequestBody(nickname: String) -> Data? {
        do {
            let body = NicknameRequestModel(nickname: nickname)
            return try JSONEncoder().encode(body)
        } catch {
            print(error)
            return nil
        }
    }
    
    // MARK: - Request 생성
    func makeNicknameUpdateRequest(body: Data?, userId: Int) -> URLRequest {
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(userId)", forHTTPHeaderField: "userId")
        
        if let body = body {
            request.httpBody = body
            print(body)
        }
        
        return request
    }
    
    // MARK: - PATCH 요청 실행
    func patchNickname(to newNickname: String, userId: Int) async throws -> Bool {
        guard let body = makeRequestBody(nickname: newNickname) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = makeNicknameUpdateRequest(body: body, userId: userId)
        dump(request)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump(response)
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(NicknamePatchResponseWrapper.self, from: data)
            return decoded.success
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}

