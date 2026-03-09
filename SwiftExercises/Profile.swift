//
//  Profile.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI
import Observation

@Observable
final class ProfileStore {
    var username = "deez"
    var isPro = false
    var followerCount = 1280
}

struct ProfileView: View {
    @State private var store = ProfileStore()
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileSummary(store: store)
            Toggle("Pro Account", isOn: $store.isPro)
            
            Button("Add 10 followers") {
                store.followerCount += 10
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ProfileSummary: View {
    let store: ProfileStore
    
    var body: some View {
        VStack(spacing: 8) {
            Text("@\(store.username)")
                .font(.title2.bold())
            
            Text(store.isPro ? "Pro memeber" : "Free member")
                .foregroundStyle(.secondary)
            
            Text("Followers: \(store.followerCount)")
        }
    }
}

#Preview {
    ProfileView()
}
