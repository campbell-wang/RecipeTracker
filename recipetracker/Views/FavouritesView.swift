
import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationStack {
            Text("Favourites")
                .navigationTitle("Favourites")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
