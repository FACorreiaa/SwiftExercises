//
//  NavigationView.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let title: String
}

struct BookNavigation: View {
    @State private var books = [
        Book(title: "Swift Programming"),
        Book(title: "Practical SwiftUI")
    ]
    @State private var isAddPresented = false

    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink(book.title) {
                    Text("Details for \(book.title)")
                        .font(.title3)
                }
            }
            .navigationTitle("Books")
            .toolbar {
                Button("Add") {
                    isAddPresented = true
                }
            }
            .sheet(isPresented: $isAddPresented) {
                AddBookView { newTitle in
                    books.append(Book(title: newTitle))
                }
            }
        }
    }
}

struct AddBookView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    let onSave: (String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Book title", text: $title)
            }
            .navigationTitle("New Book")
            .toolbar {
                Button("Save") {
                    onSave(title)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
    }
}

#Preview {
    BookNavigation()
}
