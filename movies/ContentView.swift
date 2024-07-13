//
//  ContentView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]


    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { item in
                    NavigationLink {
                        Text("Item at \(item.title)")
                    } label: {
                        Text(item.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .onAppear {
            if movies.isEmpty {
                loadData()
            }
        }
    }

    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
    
    
    private func loadData() {
        do {
            guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
                fatalError("Failed to find movies.json")
            }

            let data = try Data(contentsOf: url)
            let movies = try JSONDecoder().decode([Movie].self, from: data)

            for movie in movies {
                modelContext.insert(movie)
            }
        } catch {
            print("Failed to load movies.")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
