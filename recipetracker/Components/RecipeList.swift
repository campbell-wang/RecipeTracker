
import SwiftUI

struct RecipeList: View {
    @State private var showAddRecipeSheet = false
    var recipeList : [Recipe]
    var body: some View {
        VStack {
            HStack {
                Text("\(recipeList.count) \(recipeList.count != 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .opacity(0.75)
                
                Spacer()
                
                Button {
                    showAddRecipeSheet.toggle()
                } label: {
                    Label("Add Recipe", systemImage: "plus").labelStyle(.iconOnly)
                }.sheet(isPresented: $showAddRecipeSheet) {
                    AddRecipeView()
                }
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipeList) { recipe in
                    NavigationLink {
                        RecipeView(recipe: recipe)
                    } label: {
                        RecipeCard(recipe: recipe)
                    }

                }
            }.padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList(recipeList: Recipe.recipes)
    }
}
