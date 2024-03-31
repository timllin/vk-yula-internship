//
//  APIEndpoint.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum ServicesAPI {
    case getServices
}

extension ServicesAPI: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getServices:
            return URL(string: "https://publicstorage.hb.bizmrg.com")!
        }
    }

    var path: String {
        switch self {
        case .getServices:
            return "sirius/result.json"

        }
    }

    var urlRequest: URLRequest {
        switch self {
        case .getServices:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
