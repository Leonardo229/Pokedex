//
//  InjectModule.swift
//  DI
//
//  Created by Leonardo Coelho on 11/01/23.
//

// MARK: Otimizar a injeção com referencias fracas e criar uma função para remover modulos que não estão sendo utilizados na aplicação

import Foundation
import Utils
import Combine

public struct InjectFeature  {
    
    static var subscriptions = Set<AnyCancellable>()

    
    public static func injectFeture() {
        
       ModulesManager.modulesSubject.eraseToAnyPublisher()
            .sink(receiveValue: {
                feature in
                switch feature {
                case .Global:
                    GlobalFeature.inject()
                case .PokemonList:
                    PokemonListModule.inject()
                }
            }
            ).store(in: &subscriptions)
    
        
    }
    
}
