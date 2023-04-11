//
//  ModulesManager.swift
//  Utils
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Combine



public struct ModulesManager {
    
    public static let modulesSubject = PassthroughSubject<Features, Never>()
    
    public static func insertFature(feature: Features) {
        modulesSubject.send(feature)
    }
    
}
