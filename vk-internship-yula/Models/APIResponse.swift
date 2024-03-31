//
//  APIResponse.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import Foundation

struct APIResponse: Decodable {
    let body: Services
    let status: Int
}

