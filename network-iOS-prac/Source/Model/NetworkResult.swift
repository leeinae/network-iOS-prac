//
//  NetworkResult.swift
//  network-iOS-prac
//
//  Created by inae Lee on 2020/11/26.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
