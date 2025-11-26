//
//  PokemonDetailView.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 26/11/25.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var viewModel = PokemonDetailViewModel()
    
    private let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Button(
                        action: { presentationMode.wrappedValue.dismiss() },
                        label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    )
                    Color.clear
                    if let order = viewModel.pokemonDetail?.id.orderFomat() {
                        Text(order)
                    }
                }
                .frame(width: .infinity, height: 200)
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                    
                    VStack {
                        AsyncImage(
                            url: URL(string: ImageUtil.imageURL(from: pokemon.url)),
                            content: { image in
                                image
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .top)
                            },
                            placeholder: {}
                        )
                        Text(pokemon.name.capitalized).font(.title)
                        
                        HStack {
                            if let weight = viewModel.pokemonDetail?.weight {
                                VStack {
                                    Text(weight.inKilogramsFormat())
                                    Text("WEIGHT")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            Divider()
                            if let height = viewModel.pokemonDetail?.height {
                                VStack {
                                    Text(height.inMetersFormat())
                                    Text("HEIGHT")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        
                        if let stats = viewModel.pokemonDetail?.stats {
                            LazyVGrid(columns: [GridItem(spacing: 0, alignment: .leading), GridItem(.fixed(35), spacing: 0), GridItem()]) {
                                ForEach(stats, id: \.self) { stat in
                                    Text("\(stat.stat.name.uppercased())").font(.caption)
                                    Text("\(stat.base_stat)").font(.caption)
                                    ProgressView(value: Double(stat.base_stat) / 255)
                                    
                                }
                            }
                            .padding()
                        }
                        
                        Spacer()
                    }
                    .offset(y: -150)
                }
                .frame(width: .infinity, height: .infinity)
                .padding(8)
            }
        }
        .background(Color.teal)
        .toolbar(.hidden)
        .task {
            do {
                try await viewModel.fetchPokemonDetail(from: pokemon.url)
            } catch {
                print(error)
            }
        }
    }
    
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
}
