//
//  ModelRecipes.swift
//  Recipe List App
//
//  Created by Léa Dukaez on 23/06/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
}
