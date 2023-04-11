//
//  PokemonRepo.swift
//  Domain
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Combine

public protocol PokemonRepo {
    mutating func getPokemons(limit: Int, offset: Int) -> AnyPublisher<(pokemons: [Pokemon], count: Int), Error>
}
