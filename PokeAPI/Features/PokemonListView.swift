
import SwiftUI

struct PokemonListView: View {
    
    @State var pokemonList: [Pokemon] = []
    
    var body: some View {
         
        NavigationView {
            
            List(pokemonList, id: \.name) { pokemon in
                PokemonCardView(pokemon: pokemon)
            }
            
            .onAppear() {
                PokemonAPI().loadPokemon { result in
                    
                    switch result {
                        case .success(let pokemonList):
                            self.pokemonList = pokemonList
                        case .failure(let error):
                            print(error)
                    }
                    
                }
            }
            .navigationTitle("Pokémon list")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
