//
//  ContentView.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:16) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(.blue)
            
            Text("Developers! 👨‍💻")
                .font(.title2.bold())
            
            Text("iOS Developer")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            HStack(spacing:12) {
                Label("SwiftUI", systemImage:"swift")
                
                Label("Swift", systemImage:"arrow.2.circlepath.circle")
            }
            .font(.caption)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue.opacity(0.1))
            .clipShape(Capsule())
            ProfileStatsView()
            NavigationLink(destination: Text("Hello, World!")) {
                Text("Go to the next view")
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
}
