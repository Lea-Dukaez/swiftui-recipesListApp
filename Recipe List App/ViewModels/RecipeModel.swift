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
    
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // get target portion by multiplying numerator by the target servings
            numerator *= targetServings
            
            // reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // calculate whole portion
                wholePortions = numerator / denominator
                
                // calculate the reminder
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            // express the reminder as a fraction
            if numerator > 0 {
                // Assign reminder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            

            // if we need to pluralize

            if wholePortions > 1 {
                // calculate apporpiate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
                
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }

        
        return portion
    }
    
}
