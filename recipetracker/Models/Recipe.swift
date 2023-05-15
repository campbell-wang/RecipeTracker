
import Foundation

enum Category: String, CaseIterable, Identifiable, Hashable {
    var id: String {self.rawValue}
    case chicken = "Chicken"
    case beef = "Beef"
    case pork = "Pork"
    case rice = "Rice"
    case noodles = "Noodles"
    case korean = "Korean"
    case taiwanese = "Taiwanese"
    case western = "Western"
}

enum CategoryPics: String {
    case chicken
    case beef
    case pork
    case rice
    case noodles
    case korean
    case taiwanese
    case western
    
    var imageUrl: String {
        switch self {
        case .chicken:
            return "https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/Crispy-Fried-Chicken_EXPS_TOHJJ22_6445_DR%20_02_03_11b.jpg"
        case .beef:
            return "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/roast-beef-recipes-536cd86.jpg?quality=90&resize=440,400"
        case .pork:
            return "https://keviniscooking.com/wp-content/uploads/2022/04/Honey-Glazed-Crispy-Pork-Belly-square.jpg"
        case .rice:
            return "https://cdn.loveandlemons.com/wp-content/uploads/2020/03/how-to-cook-rice.jpg"
        case .noodles:
            return "https://www.chewoutloud.com/wp-content/uploads/2021/05/lo-mein-square-500x500.jpg"
        case .korean:
            return "https://www.iwmbuzz.com/wp-content/uploads/2021/12/craving-for-a-korean-restaurant-kimchi-to-jjajangmyeon-recipes-you-should-try-once-in-life-8.jpeg"
        case .taiwanese:
            return "https://res.klook.com/image/upload/c_fill,w_800,h_533/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/gzt3k1ggfshynr7wdmd2.webp"
        case .western:
            return "https://cdn.pixabay.com/photo/2015/06/30/19/55/food-826741_640.jpg"
        }
    }
}

struct IdentifiableStr: Identifiable, Hashable {
    let string: String
    var id: String { string }
}

struct Recipe: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let image: String
    let ingredients: [String]
    let directions: String
    let category: [Category.RawValue]
    let prepTime: Int
}

extension Recipe {
    static let recipes: [Recipe] = [
        .init(name: "Beef Noodle Soup",
              image: "https://www.thespruceeats.com/thmb/ABkIbUeYTsxUQZYiFdJTzIK_r9s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/taiwanese-beef-noodle-soup-4777014-hero-01-e06a464badec476684e513cad44612da.jpg",
              ingredients: ["10g chicken breast",
                            "10g chicken breast",
                            "10g chicken breast",
                            "10g chicken breast",
                            "10g chicken breast",
                            "10g chicken breast",
                            "10g chicken breast",
                                          "beef",
                                          "tomatoes"],
              directions: "Gather the ingredients. Make a spice sachet with the star anise, cinnamon stick, bay leaves, Sichuan peppercorns, and white peppercorns. Spice sachet with the star anise, cinnamon stick, bay leaves, Sichuan peppercorns, and white peppercorns Add the beef soup bones to a large soup pot. Add enough water to cover the bones and bring the water to a boil. Boil the soup bones for 3 minutes. Drain the bones and wash off any foam and residue from the bones. If using beef shank, boil the beef shank for 3 minutes and drain. Beef soup bones in a pot with water Brown the beef chuck or shank with 1 tablespoon of oil for 15 to 20 minutes in a big soup pot until the meat is caramelized. Set aside the browned beef on a plate. Beef chuck cooking in a pot Turn the heat to medium-low. Add the remaining tablespoon of oil to the soup pot. Add the garlic, ginger, green onions, onion, and chili. Aromatics for taiwanese beef noodle soup cooking in pot Fry the aromatics until the garlic is lightly browned, about 2 minutes. Garlic, ginger, green onions, onion, and chili cooking in a pot Add the sugar, spicy bean paste, and tomatoes. Fry until the tomatoes are softened, about 3 minutes.",
              category: ["Beef", "Taiwanese"],
              prepTime: 30),
        .init(name: "Spicy Szechuan Noodles with Garlic Chili Oil",
              image: "https://i.pinimg.com/originals/7e/d8/7b/7ed87beda76568e4274e07e79d11780c.jpg",
              ingredients: ["Chili pepper flakes", "Oil", "Black vinegar", "Garlic"],
              directions: "Heat the oil over medium lo,w heat. Once heated, sauté the garlic until it becomes fragrant, about 30 seconds. Adding Szechuan chili pepper flakes to garlic oil to make a chili oil sauce. Turn off the heat and while the garlic oil is still hot, add in the Szechuan pepper flakes, soy sauce, vinegar, salt, and sugar. Stir to combine. Adding soy sauce to garlic chili oil and stirring with a wooden spoon. Boil the noodles according to the directions and rinse under cold water. Drain well. Photo collage of Szechuan garlic chili oil noodles with scallions and extra chili pepper flakes in a bowl. Add scallions, cilantro, sesame seeds, and garlic chili oil sauce to your liking. Toss to combine and enjoy!",
              category: ["Taiwanese", "Noodles"],
              prepTime: 10)
    ]
}


