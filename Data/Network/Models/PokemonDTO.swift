//
//  PokemonDTO.swift
//  Data
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import UIKit
import SwiftUI
import Domain
import Utils

public struct PokemonDTO: Codable {
    public var name: String?
    public var url: String?
}

public extension PokemonDTO {
     func toDomain() -> Pokemon {
        let number: Int = Int(URL.init(string: self.url ?? "")?.lastPathComponent ?? "0") ?? 0
         return Pokemon(id: "\(number)", name: self.name ?? "Unknow", pokedexNumber: number)
    }
    
    
}
