//
//  PokemonListView.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 26/11/25.
//

import SwiftUI

struct PokemonListView: View {
    
    @State private var viewModel = PokemonListViewModel()
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.pokedex, id: \.name) { pokemon in
                        NavigationLink (
                            destination: {
                                PokemonDetailView(pokemon: pokemon)
                            }, label: {
                                PokemonItemView(pokemon: pokemon)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .task {
                    do {
                        try await viewModel.fetchPokedex()
                    } catch {
                        print(error)
                    }
                }
            }
            .navigationTitle("Pokedex")
            .toolbarBackground(Color(.pokedex))
            .environment(viewModel)
        }
    }
}

#Preview {
    PokemonListView()
}
