//
//  BaseListResponse.swift
//  Data
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation

public struct BaseListResponse<T: Codable> : Codable {
    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [T]?
}
