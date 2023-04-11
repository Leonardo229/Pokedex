//
//  PokemonRepoImpl.swift
//  Data
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Domain
import Combine
import Utils


public class PokemonRepoImpl: PokemonRepo {
    
    @Inject var pokemonService: PokemonService

    public init() {}
    
    public func getPokemons(limit: Int, offset: Int)  -> AnyPublisher<(pokemons: [Pokemon], count: Int), Error> {
        return pokemonService.getPokemons(limit: limit, offset: offset).map({a in
            return (pokemons: a.results?.map({$0.toDomain()}) ?? [], count: a.count ?? 0)})
        .mapError({error in
            return error
        })
        .eraseToAnyPublisher()
        

    }
}
