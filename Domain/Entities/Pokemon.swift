//
//  Pokemon.swift
//  Domain
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import SwiftUI
import Utils

public struct Pokemon: Identifiable, Equatable {
    public var id: String
    public var name: String
    public var pokedexNumber: Int
    public var mainColor: Color? = nil
    
    public init(id: String, name: String, pokedexNumber: Int) {
        self.id = id
        self.name = name
        self.pokedexNumber = pokedexNumber
    }
    
    
    public func getMainImageURL(isShiny: Bool = false) -> String {
        return "\(isShiny ? POKEMON_SHINY_IMAGE_URL : POKEMON_IMAGE_URL)\(self.name).png"
    }

    
    public func getMainColorURL(isShiny: Bool = false) -> String {
        return "\(isShiny ? POKEMON_SHINY_COLOR_URL : POKEMON_COLOR_URL)\(self.pokedexNumber).png"
    }
}

