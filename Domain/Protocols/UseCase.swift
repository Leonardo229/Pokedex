//
//  UseCase.swift
//  Domain
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation

public protocol UseCase {
    associatedtype RequestValue
    associatedtype ResponseValue
    
    mutating func execute(value: RequestValue) -> ResponseValue

}
