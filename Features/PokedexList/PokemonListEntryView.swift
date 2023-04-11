//
//  PokemonListEntryView.swift
//  PokemonList
//
//  Created by Leonardo Coelho on 11/01/23.
//

import SwiftUI
import Utils

public struct PokemonListEntryView: View {
    public init(){
        ModulesManager.insertFature(feature: .PokemonList)
    } 
    public var body: some View {
        PokemonListView().navigationBarHidden(true)
    }
}

struct PokemonListEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListEntryView()
    }
}
