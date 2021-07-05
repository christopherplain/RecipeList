//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/3/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes: [Recipe]
    
    init() {
        recipes = DataService.getRecipes()
    }
}
