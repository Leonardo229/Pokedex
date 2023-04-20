//
//  ContentView.swift
//  Pokedex
//
//  Created by Leonardo Coelho on 11/01/23.
//

import SwiftUI
import Utils
import AppNavigation
import PokemonList

struct ContentView: View {
    
    
    @Inject var navigationModule: NavigationManager
    
    
    var body: some View {
        NavigationView{
            
            NavigationLink(isActive: navigationModule.navigationBinding(route: .PokemonList), destination:{ PokemonListEntryView()}, label: {EmptyView()})
            
            
        }.navigationBarHidden(true)
        .environment(\.colorScheme, .light)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
