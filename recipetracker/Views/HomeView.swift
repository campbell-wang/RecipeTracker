
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                RecipeList(recipeList: recipeViewModel.recipes)
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}
