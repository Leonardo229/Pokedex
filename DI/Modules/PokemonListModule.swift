//
//  PokemonListModule.swift
//  DI
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Data
import Utils
import Domain
import PokemonList

public struct PokemonListModule : Module {
    
    public init() {}
    
    public static func inject(){
        DependencyInjector.register(dependency: PokemonService())
        DependencyInjector.register(dependency: PokemonRepoImpl() as PokemonRepo)
        DependencyInjector.register(dependency: FetchPokemonsUseCase())
        DependencyInjector.register(dependency: PokemonListViewModel())
     }
}
