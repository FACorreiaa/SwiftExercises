//
//  AppStorageExample.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct AppStorageExample: View {
    @AppStorage("saved username") private var savedUsername = ""
    @AppStorage("has_seen_onboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        Form {
            Section("Profile") {
                TextField("Username", text: $savedUsername)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Preferences") {
                Toggle("has been onboarding", isOn: $hasSeenOnboarding)
            }
            
            Section("Stored values") {
                            Text("Username: \(savedUsername.isEmpty ? "None" : savedUsername)")
                            Text("Seen onboarding: \(hasSeenOnboarding ? "Yes" : "No")")
                        }
        }
    }
}

#Preview {
    AppStorageExample()
}
