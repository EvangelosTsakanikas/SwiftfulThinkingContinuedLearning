//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by user268168 on 12/3/24.
//

import SwiftUI
import CoreData

@main
struct CoreDataBootcampApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
