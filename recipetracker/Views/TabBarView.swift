
import SwiftUI

struct TabBarView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.3.layers.3d.down.right")
                }

            
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(RecipeViewModel())
    }
}
