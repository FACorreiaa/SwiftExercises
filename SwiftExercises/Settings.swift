//
//  Settings.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct SettingsView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        Button("Open Settings") {
            isSheetPresented = true
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $isSheetPresented) {
            SettingsViewChild()
        }
    }
}

struct SettingsViewChild: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing:16) {
            Text("Current theme: \(colorScheme == .dark ? "Dark" : "Light")")
            
            Button("Close") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
