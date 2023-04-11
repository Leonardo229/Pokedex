//
//  PokemonListViewModel.swift
//  PokemonList
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Combine
import Domain
import Utils


public class PokemonListViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()

    
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var pokemonsList: [Pokemon] = []
    @Published private(set) var hasError: Bool = false
    @Published private(set) var animatedLoading = false

    
    private var count: Int = 0
    private let limit: Int = 20
    private var offset: Int = 0
    
    @Inject var fetchPokemonsUseCase: FetchPokemonsUseCase
    public init() {}
    
    

    
    func toggleAnimation() {
        animatedLoading.toggle()
    }
    
    
    func getPokemonList() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.getData()
        }
        
    }
    
    func refreshList() {
        getData()
    }
    
    func getData() {

        fetchPokemonsUseCase.execute(value: (limit: limit, offset: offset))
            .sink(
            receiveCompletion: {
                [weak self] error in
                self?.hasError = true
                self?.isLoading = false
            },
            receiveValue: {
                [weak self] data in
                self?.isLoading = false
                self?.count = data.count
                self?.pokemonsList += data.pokemons
                self?.offset += self?.limit ?? 0
            }).store(in: &subscriptions)
    }
    
    
}
