//
//  APIResponse.swift
//  network-iOS-prac
//
//  Created by inae Lee on 2020/11/26.
//

import Foundation

struct APIResponse: Codable {
    let tests: [Person]
}

// MARK: - Test
struct Person: Codable {
    let id: Int
    let url: String
    let nickname: String
}

enum CodinKeys: String, CodingKey {
    case id = "id"
    case url = "url"
    case nickname = "nickname"
}
