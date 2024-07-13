//
//  EditView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI

struct EditView: View {
    
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
            
        }
    }
}

#Preview {
    EditView(isNew: true)
}
