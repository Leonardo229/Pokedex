//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Leonardo Coelho on 11/01/23.
//

import SwiftUI
import Utils
import DI

@main
struct PokedexApp: App {
    init() {
        InjectFeature.injectFeture()
        ModulesManager.insertFature(feature: .Global)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
