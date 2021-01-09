//
//  Coffee+CoreDataProperties.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/8/21.
//
//

import Foundation
import CoreData


extension Coffee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coffee> {
        return NSFetchRequest<Coffee>(entityName: "Coffee")
    }

    @NSManaged public var name: String
    @NSManaged public var roastType: String
    @NSManaged public var origin: String
    @NSManaged public var rating: Int16
    @NSManaged public var date: Date
    //@NSManaged public var flavorNotes: [String]

}

extension Coffee : Identifiable {

}
