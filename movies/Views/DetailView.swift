//
//  DetailView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI

struct DetailView: View {
    
    @State var shouldPresentSheet = false
    
    var movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.title)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            
            Form {
                Section("Cast and Crew") {
                    Text(movie.directors)
                    Text(movie.writers)
                    Text(movie.actors)
                }
                
                Section("Ratings") {
                    Text(movie.mpaRating)
                    Text("\(movie.criticsRating)")
                }
                
                Section("Details") {
                    Text("Duration: \(movie.length) minutes")
                    Text(movie.studio)
                    Text(movie.shortDescription)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    shouldPresentSheet.toggle()
                } label: {
                    Text("Edit")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $shouldPresentSheet) {
            EditView(
                actors: movie.actors,
                criticsRating: "\(movie.criticsRating)",
                directors: movie.directors,
                genres: movie.genres,
                lenght: "\(movie.length)",
                movieID: "\(movie.movieID)",
                mpaRating: movie.mpaRating,
                shortDescription: movie.shortDescription,
                studio: movie.studio,
                title: movie.title,
                writers: movie.writers,
                year: movie.year
            )
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(
            movie: Movie(
                actors: "Mark Hamill, Harrison Ford, Carrie Fisher",
                criticsRating: 8.7,
                directors: "Irvin Kershner",
                genres: "Action, Adventure, Fantasty",
                length: 124,
                movieID: 1,
                mpaRating: "PG",
                shortDescription: "After the Rebels are overpowered by the Empire, Luke Skywalker begins his Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.",
                studio: "Twentieth Century Fox",
                title: "Star Wars: Episode V - The Empire Strikes Back",
                writers: "Leigh Brackett, Lawrence Kasdan,George Lucas",
                year: "1980"
            )
        )
    }
}
