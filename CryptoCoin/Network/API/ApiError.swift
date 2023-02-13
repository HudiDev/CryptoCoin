//
//  ApiError.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation


enum APIError: Error, LocalizedError {

    case requestFailed
    case failedSerialization
    
    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "There is currently an issue with your request. please contact support"
        case .failedSerialization:
            return "Failed to serialize request"
        }
    }
}
