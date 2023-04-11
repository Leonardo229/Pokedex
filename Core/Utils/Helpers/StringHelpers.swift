//
//  StringHelpers.swift
//  Utils
//
//  Created by Leonardo Coelho on 14/01/23.
//

import Foundation
import SwiftUI


public extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}



public extension Text {
    
}
