//
//  PokemonListView.swift
//  PokemonList
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import SwiftUI
import Utils


struct PokemonListView: View {
    
    
    
    
    @ObservedObject var viewModel : PokemonListViewModel = DependencyInjector.resolve()
    
    var body: some View {
        NavigationView {
            VStack {
                
                if viewModel.isLoading {
                    
                    VStack {
                        Image("pokeball", bundle:  Bundle(identifier: "com.pokedex.PokedexList"))
                            .resizable()
                            .frame(width: 64, height: 64)
                            .offset(y: viewModel.animatedLoading ? -10 : 0)
                            .animation(
                                .interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 100).repeatForever(autoreverses: false),
                                value: viewModel.animatedLoading
                            )
                            .onAppear {
                                viewModel.toggleAnimation()
                            }
                        Text("Loading...")
                    }
                } else {
                    ScrollView{
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.pokemonsList, id: \.id) {
                                pokemon in
                                PokemonCard(pokemon: pokemon)
                                    .onAppear {
                                        if viewModel.pokemonsList.last == pokemon {
                                            viewModel.refreshList()
                                        }
                                    }
                            }
                            
                        }
                    }
                }
                
                
                
                
                
            }
            .navigationTitle("Pokedex")
            .onAppear {
                viewModel.getPokemonList()
            }
            .animation(.easeInOut, value: viewModel.isLoading)
            
            
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
