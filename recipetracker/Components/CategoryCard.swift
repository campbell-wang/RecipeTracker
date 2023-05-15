
import SwiftUI

struct CategoryCard: View {
    
    var category: String
    
    var categoryPic: CategoryPics {
        return CategoryPics(rawValue: category.lowercased())!
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: categoryPic.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(category)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 136)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
//            Text()
        }
        .frame(width: 160, height: 217, alignment: .top)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category.chicken.rawValue)
    }
}
