//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Christopher Plain on 7/5/21.
//

import SwiftUI

struct RecipeTabView: View {
    @State var selectedTab = "featured"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            //MARK: Featured View
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag("featured")
            // MARK: List View
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag("list")
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
