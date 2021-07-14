//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/3/21.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var servingSize = 2
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    .padding(.leading)
                // MARK: Serving Size
                VStack(alignment: .leading) {
                    Text("Seclect your serving size:")
                    Picker("Serving Size", selection: $servingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(recipe.ingredients) { ingredient in
                        Text("• \(RecipeModel.getPortion(ingredient: ingredient, receipeServings: recipe.servings, targetServings: servingSize)) \(ingredient.name.lowercased())")
                    }
                }
                .padding(.horizontal)
                Divider()
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text("\(index + 1). \(recipe.directions[index])")
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
