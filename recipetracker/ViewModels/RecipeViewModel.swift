
import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes : [Recipe]
    
    init() {
        recipes = Recipe.recipes
    }
    
    func saveRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
