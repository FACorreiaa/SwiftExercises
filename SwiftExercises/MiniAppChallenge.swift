//
//  MiniAppChallenge.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    let title: String
}

struct MiniApp: View {
    @State private var notes: [Note] = []
    @State private var isAddPresented = false

    var body: some View {
        NavigationStack {
            List {
                if notes.isEmpty {
                    Text("No notes yet")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(notes) { note in
                        Text(note.title)
                    }
                    .onDelete(perform: deleteNotes)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                Button("Add") {
                    isAddPresented = true
                }
            }
            .sheet(isPresented: $isAddPresented) {
                AddNoteView { title in
                    notes.append(Note(title: title))
                }
            }
        }
    }

    private func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    let onSave: (String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
            }
            .navigationTitle("New Note")
            .toolbar {
                Button("Save") {
                    onSave(title)
                    dismiss()
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    MiniApp()
}
