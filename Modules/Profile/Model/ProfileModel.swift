import Foundation

struct ProfileResponse: Decodable {
    let username: String
    let favorites: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let usefulness: String
    let calories: String
    let proteins: String
    let fats: String
    let cookTime: String
    let description: String
    let instructions: String
    let category: String
    let ingredients: [Ingredient]
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, image, usefulness, calories, proteins, fats
        case cookTime = "cook_time"
        case description, instructions, category, ingredients
        case isFavorite = "is_favorite"
    }
}

struct Ingredient: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
