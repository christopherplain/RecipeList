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
    
    static func getPortion(ingredient: Ingredient, receipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Portion is recipe portion * 1/recipe servings * target servings.
            numerator *= targetServings
            denominator *= receipeServings
            // Get whole portions and remainder.
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                portion += String(wholePortions)
            }
            //Express the remainder as a fraction.
            if numerator > 0 {
                let divisor = Rational.greatestCommonDivisor(numerator, denominator)
                numerator /= divisor
                denominator /= divisor
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            // Pluralize if needed.
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.last == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            portion += ingredient.num != nil ? " " : ""
            portion += unit
        }
    
        return portion
    }
}
