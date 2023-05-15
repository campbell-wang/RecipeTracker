
import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CategoryList(categoryList: Category.allCases)
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
