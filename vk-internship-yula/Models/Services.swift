//
//  Services.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import Foundation

struct Services: Decodable {
    let services: [Service]
}

struct Service: Decodable, Hashable {
    let name: String
    let description: String
    let link: String
    let iconUrl: String

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case iconUrl = "icon_url"
    }
}
