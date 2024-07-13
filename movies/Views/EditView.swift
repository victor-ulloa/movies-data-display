//
//  EditView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State var isNew: Bool = false
    
    @State var actors: String = ""
    @State var criticsRating: String = ""
    @State var directors: String = ""
    @State var genres: String = ""
    @State var lenght: String = ""
    @State var movieID: String = ""
    @State var mpaRating: String = ""
    @State var shortDescription: String = ""
    @State var studio: String = ""
    @State var title: String = ""
    @State var writer: String = ""
    @State var year: String = ""
    
    var body: some View {
        Form {
            Section("Basic Information") {
                TextField("Title", text: $title)
            }
            
            Section("Cast and Crew") {
                TextField("Directors", text: $directors)
                TextField("Writer", text: $writer)
                TextField("Actors", text: $actors)
            }
            
            Section("Ratings") {
                TextField("MPA Rating", text: $mpaRating)
                TextField("Critics Rating", text: $criticsRating)
                    .keyboardType(.decimalPad)
            }
            
            Section("Details") {
                TextField("Length", text: $lenght)
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
                        length: Int(lenght) ?? 0,
                        movieID: Int(movieID) ?? 0,
                        mpaRating: mpaRating,
                        shortDescription: shortDescription,
                        studio: studio,
                        title: title,
                        writers: writer,
                        year: year
                    )
                    modelContext.insert(newMovie)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    dismiss()
                }
            } label: {
                Text("Save")
            }
            
        }
    }
}

#Preview {
    EditView(isNew: true)
}
