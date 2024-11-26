//
//  addBookView.swift
//  Bookworm
//
//  Created by RATSIMANOSIKA HERY on 23/11/2024.
//

import SwiftData
import SwiftUI

struct addBookView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 2
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var validEnties: Bool {
        !title.isEmpty && !author.isEmpty && !genre.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Name of book", text: $title)
                TextField("Author's name", text: $author)
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) { genre in
                        Text(genre)
                    }
                }
            }
            Section("Write a review"){
                TextEditor(text: $review)
                RatingView(rating: $rating)
            }
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    context.insert(newBook)
                    dismiss()
                }
                .disabled(!validEnties)
            }
        }
        .navigationTitle("Add Book")
    }
}

#Preview {
    addBookView()
}
