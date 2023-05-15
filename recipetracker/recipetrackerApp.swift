
import SwiftUI

@main
struct recipetrackerApp: App {
    @StateObject var recipeVM = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(recipeVM)
        }
    }
}
