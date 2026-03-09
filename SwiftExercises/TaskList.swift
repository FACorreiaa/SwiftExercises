//
//  TaskList.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
}

struct TaskList: View {
    @State private var tasks = [
        TaskItem(title: "Review Swift Optionals"),
        TaskItem(title: "Build a List screen"),
        TaskItem(title: "Practice interview answers")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    Text(task.title)
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Study tasks")
        }
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    TaskList()
}

