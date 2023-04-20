//
//  GlobalModule.swift
//  DI
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import AppNavigation
import Utils


public struct GlobalFeature: Module {
     public static func inject() {
         @Provider var navigation = NavigationManager()
    }
}
