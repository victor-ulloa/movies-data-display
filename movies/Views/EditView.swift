//
//  EditView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI
import SwiftData

struct EditView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @Query var movies: [Movie]
    
    @State var isNew: Bool = false
    var id: Int = 0
    
    @State var actors: String = ""
    @State var criticsRating: String = ""
    @State var directors: String = ""
    @State var genres: String = ""
    @State var length: String = ""
    @State var movieID: String = ""
    @State var mpaRating: String = ""
    @State var shortDescription: String = ""
    @State var studio: String = ""
    @State var title: String = ""
    @State var writers: String = ""
    @State var year: String = ""
    
    init(id: Int) {
        self.id = id
    }
    
    init(isNew: Bool, movieId: String) {
        self.isNew = isNew
        self.movieID = movieId
    }
    
    var body: some View {
        Form {
            Section("Basic Information") {
                TextField("Title", text: $title)
            }
            
            Section("Cast and Crew") {
                TextField("Directors", text: $directors)
                TextField("Writers", text: $writers)
                TextField("Actors", text: $actors)
            }
            
            Section("Ratings") {
                TextField("MPA Rating", text: $mpaRating)
                TextField("Critics Rating", text: $criticsRating)
                    .keyboardType(.decimalPad)
            }
            
            Section("Details") {
                TextField("Length", text: $length)
                    .keyboardType(.numberPad)
                TextField("Studio", text: $studio)
                TextField("Short Description", text: $shortDescription,  axis: .vertical)
                    .lineLimit(5...10)
            }
            
            Button {
                if isNew {
                    let newMovie = Movie(
                        actors: actors,
                        criticsRating: Double(criticsRating) ?? 0,
                        directors: directors,
                        genres: genres,
                        length: Int(length) ?? 0,
                        movieID: Int(movieID) ?? 0,
                        mpaRating: mpaRating,
                        shortDescription: shortDescription,
                        studio: studio,
                        title: title,
                        writers: writers,
                        year: year
                    )
                    modelContext.insert(newMovie)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    if let movie = movies.first(where: { $0.movieID == id }) {
                        movie.actors = actors
                        movie.criticsRating = Double(criticsRating) ?? 0
                        movie.directors = directors
                        movie.length = Int(length) ?? 0
                        movie.mpaRating = mpaRating
                        movie.shortDescription = shortDescription
                        movie.studio = studio
                        movie.title = title
                        movie.writers = writers
                        movie.year = year
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            } label: {
                Text("Save")
            }
            
        }
        .onAppear {
            print(movies.first(where: { $0.movieID == id })?.title)
            print(id)
            
            if !isNew, let movie = movies.first(where: { $0.movieID == id }) {
                self.actors = movie.actors
                self.criticsRating = "\(movie.criticsRating)"
                self.directors = movie.directors
                self.genres = movie.genres
                self.length = "\(movie.length)"
                self.mpaRating = movie.mpaRating
                self.shortDescription = movie.shortDescription
                self.studio = movie.studio
                self.title = movie.title
                self.writers = movie.writers
                self.year = movie.year
            }
        }
    }
}

#Preview {
    EditView(id: 10)
        .modelContainer(for: [Movie.self])
}
