//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Léa Dukaez on 23/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View { 
        
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical)
                       
                    ForEach (recipe.ingredients) { item in
                        Text("• " + item.name)
                            .padding(.bottom, 1)
                    }
                }.padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }.padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
