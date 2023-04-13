//
//  PokemonCard.swift
//  PokemonList
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import SwiftUI
import Domain
import Utils

struct PokemonCard: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .trailing) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("#\(String(format: "%03d",pokemon.pokedexNumber))")
                            .font(Font.system(size: 16))
                            .fontWeight(.black)
                        Spacer()
                        Text(pokemon.name.firstUppercased)
                            .font(Font.system(size: 24))
                            .fontWeight(.black)
                        
                        Spacer()
                        
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 104)
                .foregroundColor(pokemon.mainColor)
                .background(Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .padding(.horizontal)
                
                
                AsyncImage(url: URL(string: pokemon.getMainImageURL()), scale: 2) { image in
                    image
                        .resizable()
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -2.5, y: -2.5)
                        .offset(y: -28)
                    
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 148, height: 148)
                .padding(.trailing)
                
                
            }
            .opacity(pokemon.mainColor == nil ? 0 : 1)
            .animation(.easeInOut, value: pokemon.mainColor)
            .offset(x: pokemon.mainColor == nil ? UIScreen.main.bounds.size.width : 0)
            .animation(.easeInOut, value: pokemon.mainColor)
        }
        
        .onAppear {
            DispatchQueue.global().async {
                
                if let data = try? Data(contentsOf: URL(string: pokemon.getMainColorURL())!) {
                    if let image = UIImage(data: data) {
                        image.getColors(quality: .high) {
                             colors in
                            DispatchQueue.main.async {
                                self.pokemon.mainColor = Color(colors.background)
                            }
                            
                        }
                    }
                }
            }
            
            
        }
    }
    
}
