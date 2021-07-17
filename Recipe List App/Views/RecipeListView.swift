//
//  ContentView.swift
//  Recipe List App
//
//  Created by Léa Dukaez on 23/06/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    
                                    // MARK: Row Item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60.0, height: 60.0)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name).foregroundColor(.black)
                                    }
                                })
                        }
                    }
                    
                }
                
                
            }.navigationBarHidden(true)
            .padding(.leading)
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
