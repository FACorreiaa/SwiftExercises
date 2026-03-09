//
//  Counter.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//


import SwiftUI

struct Counter: View {
    @State private var count = 0
    @State private var nickname = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(count)")
                .font(.largeTitle.bold())
            
            HStack {
                Button("-") {
                    count -= 1
                }
                .buttonStyle(.bordered)
                
                Button("+") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)
            }
            
            TextField("Nickname", text: $nickname)
                .textFieldStyle(.roundedBorder)
            
            Text("Hello, \(nickname.isEmpty ? "Anonymous" : nickname)!")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    Counter()
}
