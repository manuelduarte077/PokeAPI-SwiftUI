//
//  PokemonItemView.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 26/11/25.
//

import SwiftUI

struct PokemonItemView: View {
    
    @Environment(PokemonListViewModel.self) private var viewModel
    @State private var image: UIImage? = nil
    @State private var backgroundColor: Color?
    private let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Text(pokemon.name.capitalized)
        }
        .padding(.all, 16)
        .background(backgroundColor)
        .cornerRadius(35)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(.gray, lineWidth: 1)
        )
        .onAppear {
            Task {
                do {
                    let data = try await viewModel.fetchImage(from: ImageUtil.imageURL(from: pokemon.url))
                    self.image = UIImage(data: data)
                    self.backgroundColor = Color(uiColor: self.image?.averageColor ?? .clear)
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    PokemonItemView(pokemon: Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
        .environment(PokemonListViewModel())
}
