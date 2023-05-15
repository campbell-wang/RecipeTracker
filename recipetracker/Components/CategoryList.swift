
import SwiftUI

struct CategoryList: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    var categoryList : [Category]
    var body: some View {
        VStack {
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(categoryList) { category in
                    
                    NavigationLink {
                        ScrollView {
                            RecipeList(recipeList: recipeViewModel.recipes.filter { $0.category.contains(category.rawValue)})
                        }
                    } label: {
                        CategoryCard(category: category.rawValue)
                    }

                }
            }.padding(.top)
        }
        .padding(.horizontal)
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(categoryList: Category.allCases).environmentObject(RecipeViewModel())
    }
}
