//
//  Animation.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct AnimationExample: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(showDetails ? "Hide details" : "Show details") {
                withAnimation(.spring(duration: 0.4)) {
                    showDetails.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            
            if showDetails {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Portfolio Summary")
                        .font(.headline)
                    Text("Cash: $12,400")
                                        Text("Positions: 8")
                                        Text("Watchlist: 15")
                }
                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.green.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding()
    }
}

#Preview {
    AnimationExample()
}
