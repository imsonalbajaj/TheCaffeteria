//
//  TheCaffeteriaApp.swift
//  TheCaffeteria
//
//  Created by Sonal on 08/08/24.
//

import SwiftUI
import SwiftData

@main
struct TheCaffeteriaApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
