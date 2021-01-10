//
//  Recipe+CoreDataProperties.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/10/21.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var acidityRatio: NSDecimalNumber?
    @NSManaged public var recipeId: UUID?
    @NSManaged public var servingSize: Int16
    @NSManaged public var waterCoffeeRatio: NSDecimalNumber?

}

extension Recipe : Identifiable {

}
