//
//  DataService.swift
//  Recipe List App
//
//  Created by Léa Dukaez on 23/06/2021.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
    
                for r in recipeData {
                    r.id = UUID()
                    
                    for ingredient in r.ingredients {
                        ingredient.id = UUID()
                    }
                    
                }
                return recipeData
            }
            catch {
                print("error decoding data", error)
            }
        }
        catch {
            print("error getting data", error)
        }
    
        
        return [Recipe]()
    }
    
}
