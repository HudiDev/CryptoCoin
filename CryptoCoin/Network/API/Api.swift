//
//  Api.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation

protocol Api {
    var baseUrl: URL { get }
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String : String]? { get }
    var body: Data? { get }
    var urlRequest: URLRequest { get }
}

extension Api {
    var baseUrl: URL {
        guard let url = URL(string: "https://api.coingecko.com/api/v3") else {
            fatalError("Base Url is incorrect")
        }
        return url
    }
    
    var fullUrl: URL {
        self.baseUrl.appendingPathComponent(self.path).appendingPathComponent("/")
    }
    
    var urlRequest: URLRequest {
        var req = URLRequest(url: self.fullUrl)
        req.httpMethod = self.method.rawValue
        req.allHTTPHeaderFields = self.headers
        req.httpBody = self.body
        return req
    }
    
    func request<T: Decodable>(_ responseType: T.Type) async throws -> T {
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(for: self.urlRequest)
            do {
                let response = try JSONDecoder().decode(responseType, from: data)
                return response
            } catch (let error) {
                throw APIError.failedSerialization(error.localizedDescription)
            }
        } catch {
            throw APIError.requestFailed
        }
    }

}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
}

