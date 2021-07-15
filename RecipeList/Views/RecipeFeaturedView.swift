//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/5/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var selectedCard = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // MARK: Title
            Text("Featured Recipes")
                .font(.custom("Avenir Heavy", size: 24))
                .padding(.top, 40)
                .padding(.leading)
            GeometryReader { geo in
                // MARK: TabView
                TabView(selection: $selectedCard) {
                    ForEach(model.recipes.indices) { index in
                        if model.recipes[index].featured {
                            // MARK: Recipe Card
                            Button(action: {
                                isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(.custom("Avenir", size: 15))
                                            .padding(5)
                                    }
                                }
                            })
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .tag(index)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation time:")
                    .font(.custom("Avenir Heavy", size: 16))
                Text(model.recipes[selectedCard].prepTime)
                    .font(.custom("Avenir", size: 15))
                Text("Highlights:")
                    .font(.custom("Avenir Heavy", size: 16))
                Text(model.recipes[selectedCard].highlights.joined(separator: ", "))
                    .font(.custom("Avenir", size: 15))
            }
            .padding([.leading, .bottom])
        }
        .onAppear {
            let index = model.recipes.firstIndex { (recipe) -> Bool in
                return recipe.featured
            }
            selectedCard = index ?? 0
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
