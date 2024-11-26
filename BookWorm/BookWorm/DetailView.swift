//
//  DetailView.swift
//  Bookworm
//
//  Created by RATSIMANOSIKA HERY on 24/11/2024.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    var book: Book
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showDeletionAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(.thinMaterial)
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            VStack (spacing: 15) {
                VStack {
                    Text("By: \(book.author)")
                    Text("Added: \(book.date.formatted(date: .long, time: .shortened))")
                }
                .font(.headline)
                .foregroundStyle(.secondary)
                Text(book.review)
                RatingView(rating: .constant(book.rating))
                    .font(.largeTitle)
            }
            .padding(.horizontal, 8)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar {
            Button("Delete book", systemImage: "trash") {
                showDeletionAlert = true
            }
        }
        .alert("Delete book", isPresented: $showDeletionAlert) {
            Button("Cancel", role: .cancel, action: {})
            Button("Delete", role: .destructive, action: deleteBook)
        }message: {
            Text("Are you sure you want to delete this book?")
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "SwiftUI", author: "RATSIMANOSIKA HERY", genre: "Thriller", review: "SwiftUI is a framework for building user interfaces", rating: 5)
        return DetailView(book: example)
            .modelContainer(container)
    }catch {
        return Text("Fail to create preview: \(error.localizedDescription)")
    }
}
