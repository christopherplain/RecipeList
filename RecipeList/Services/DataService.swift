//
//  DataService.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/3/21.
//

import Foundation

struct DataService {
    static func getRecipes() -> [Recipe] {
        var recipes = [Recipe]()
        
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")

        guard path != nil else {
            return recipes
        }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            recipes = try decoder.decode([Recipe].self, from: data)
            
            for recipe in recipes {
                recipe.id = UUID()

                for ingredient in recipe.ingredients {
                    ingredient.id = UUID()
                }
            }
            
            return recipes
        } catch {
            print(error)
        }
        
        return recipes
    }
}
