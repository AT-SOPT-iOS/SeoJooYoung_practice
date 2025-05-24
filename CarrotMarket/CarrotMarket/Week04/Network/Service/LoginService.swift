//
//  LoginService.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import UIKit

final class LoginService {
    
    static let shared = LoginService()
    private init() {}
    
    // MARK: - Request Body 생성
    func makeRequestBody(loginId: String, password: String) -> Data? {
        do {
            let data = LoginRequestModel(loginId: loginId, password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print("Request Body 인코딩 실패:", error)
            return nil
        }
    }
    
    // MARK: - Request 생성
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/auth/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let headers = ["Content-Type": "application/json"]
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    // MARK: - 실제 로그인 요청
    func postLoginData(loginId: String, password: String) async throws -> LoginResponseModel {
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(LoginResponseWrapper.self, from: data)
            print("로그인 성공: userId = \(decoded.data.userId)")
            return decoded.data
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
