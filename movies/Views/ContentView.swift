//
//  ContentView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    @State var shouldPresentSheet = false


    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies.sorted(by: { $0.title < $1.title })) { item in
                    NavigationLink {
                        DetailView(movie: item)
                    } label: {
                        ListItemView(title: item.title, studio: item.studio, rating: item.criticsRating)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        shouldPresentSheet.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Movies")
            .sheet(isPresented: $shouldPresentSheet) {
                EditView(isNew: true, movieId: "\(movies.count)")
                    .presentationDragIndicator(.visible)
                    .modelContext(modelContext)
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
