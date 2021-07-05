//
//  ContentView.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/3/21.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack(spacing: 20) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipe.name)
                    }
                }
            }.navigationTitle("Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
