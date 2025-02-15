//
//  moviesApp.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI
import SwiftData

@main
struct moviesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Movie.self
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
