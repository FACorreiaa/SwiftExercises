//
//  Subscription.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct Subscription: View {
    @State private var isSubscribed = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isSubscribed ? "Subscribed" : "Not subscribed")
                .font(.title2.bold())
            
            SubscriptionToggle(isSubscribed: $isSubscribed)
        }
        .padding()
    }
}

struct SubscriptionToggle: View {
    @Binding var isSubscribed: Bool
    
    var body: some View {
        Toggle("Receive market updated", isOn: $isSubscribed)
            .toggleStyle(.switch)
    }
}

#Preview {
    Subscription()
}
