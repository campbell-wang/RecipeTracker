
import SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @State private var done = false
    @State private var pickingImage = false
    @State private var selectedImage: UIImage?
    @State private var name: String = ""
    @State private var directions: String = ""
    @State private var categories: Set<IdentifiableStr> = Set()
    @State private var ingredients: [String] = []
    @State private var prepTime: Int = 0
    
    private var categoryList = ["Chicken", "Beef", "Pork", "Rice", "Noodles", "Korean", "Taiwanese", "Western"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("Name")
                }
                
                Section {
                   Button {
                       pickingImage = true
                   }
                    label: {
                        Label("Picture", systemImage: "photo")
                    }
                } header: {
                    Text("Picture")
                }.sheet(isPresented: $pickingImage) {
                    ImagePicker(selectedImage: $selectedImage, pickerShowing: $pickingImage)
                }
                
                Section {

                    MultiSelector(
                        label: Text("Categories"),
                        options: categoryList.map { IdentifiableStr(string: $0) },
                        optionToString: { $0.string },
                        selected: $categories
                    )

                } header: {
                    Text("Categories")
                }
                
                Section {

                    ForEach(0..<ingredients.count, id: \.self) { index in
                        TextField("Ingredient \(index + 1)", text: Binding(
                            get: { self.ingredients[index] },
                            set: { self.ingredients[index] = $0 }
                        ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Button(action: {
                        self.ingredients.append("")
                    }) {
                        Label("Add Ingredient", systemImage: "plus.circle")
                    }
                    
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    TextEditor(text: $directions)
                } header: {
                    Text("Directions")
                }
                

            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark").labelStyle(.iconOnly)
                    }

                }
                ToolbarItem {
                    Button {
                        compileRecipe()
                        dismiss()
                    }
                    label: {
                        Label("Done", systemImage: "checkmark").labelStyle(.iconOnly)
                    }
                }
            })
            .navigationTitle("Add Recipe")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}

extension AddRecipeView {
    

    private func compileRecipe () {
        
        let modifiedCategory = categories.map { $0.string as Category.RawValue }
        
        let recipe: Recipe = Recipe(name: name, image: "", ingredients: ingredients, directions: directions, category: modifiedCategory, prepTime: prepTime)

        print(recipe)
        
        recipeViewModel.saveRecipe(recipe: recipe)
    }
}
