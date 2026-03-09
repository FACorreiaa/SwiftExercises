//
//  AsyncAwait.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI
import Combine

@MainActor
final class QuoteViewModel: ObservableObject {
    @Published var quote = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadQuote() async {
        isLoading = true
        errorMessage = nil
        
        do {
            try await Task.sleep(for: .seconds(1))
            
            if Bool.random() {
                throw URLError(.badServerResponse)
            }
            
            quote = "A day without sunshine is like, you know, a bad day."
        } catch {
            errorMessage = "Failed to quote"
        }
        
        isLoading = false
    }
}

struct AsyncAwaitModel: View {
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                
                Button("Retry") {
                    Task {
                        await viewModel.loadQuote()
                    }
                }
            } else {
                Text(viewModel.quote)
                    .font(.title3)
            }
        }
        .padding()
        .task {
            await viewModel.loadQuote()
        }
    }
}

#Preview {
    AsyncAwaitModel()
}
