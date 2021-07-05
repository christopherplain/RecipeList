//
//  Ingredient.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/5/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    let name: String
    let num: Int?
    let denom: Int?
    let unit: String?
}
