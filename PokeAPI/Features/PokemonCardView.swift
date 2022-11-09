
import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
       
        HStack {
            AsyncImage(url: pokemon.imageURL) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "number")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)

            Text(pokemon.name.capitalized)
                .font(.title)
                .fontWeight(.heavy)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
