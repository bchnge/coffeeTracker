//
//  coffeeTrackerApp.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI

@main
struct coffeeTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
