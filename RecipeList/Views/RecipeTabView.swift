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
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag("featured")
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag("list")
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
