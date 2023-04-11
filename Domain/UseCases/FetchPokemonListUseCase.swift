//
//  FetchPokemonListUseCase.swift
//  Domain
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Combine
import Utils



public class FetchPokemonsUseCase: UseCase {
    public typealias RequestValue = (limit: Int, offset: Int)
    public typealias ResponseValue = AnyPublisher<(pokemons: [Pokemon], count: Int), Error>
    
    @Inject var repository: PokemonRepo
    
   public init() {}
    
     public func execute(value: (limit: Int, offset: Int)) -> AnyPublisher<(pokemons: [Pokemon], count: Int), Error> {
        return repository.getPokemons(limit: value.limit, offset: value.offset)
    }

}
