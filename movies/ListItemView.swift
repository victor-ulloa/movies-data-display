//
//  ListItemView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import SwiftUI

struct ListItemView: View {
    
    var title: String
    var studio: String
    var rating: Double
    
    var body: some View {
        HStack (spacing: 20) {
            AsyncImage(url: URL(string: "https://picsum.photos/id/12/600")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 60)
            
            VStack (alignment: .leading) {
                Text(title)
                    .font(.title3)
                Text(studio)
                    .font(.caption)
                Text("Critics Rating: \(rating)")
                    .font(.caption2)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ListItemView(title: "Title", studio: "Studio", rating: 0.0)
}
