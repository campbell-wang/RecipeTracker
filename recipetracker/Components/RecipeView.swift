
import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 200)
            
            
            VStack(spacing: 20) {
                Spacer(minLength: 30)
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Ingredients:")
                        .font(.headline)
                    
                    HStack (spacing: 20){
                        
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(0...recipe.ingredients.count/2, id: \.self) { i in
                                Text("• \(recipe.ingredients[i])")
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach((recipe.ingredients.count/2)+1..<recipe.ingredients.count, id: \.self) { i in
                                Text("• \(recipe.ingredients[i])")
                            }
                        }
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Directions:")
                        .font(.headline)
                    
                    Text(recipe.directions)
                }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.recipes[0])
    }
}
