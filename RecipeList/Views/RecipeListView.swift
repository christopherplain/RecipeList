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
            VStack(alignment: .leading) {
                Text("Recipes")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 40)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
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
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
