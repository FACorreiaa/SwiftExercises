//
//  MVVM.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var message = ""

    var canSubmit: Bool {
        email.contains("@") && password.count >= 6
    }

    func submit() {
        message = canSubmit ? "Login request is valid" : "Please enter valid credentials"
    }
}

struct MVVM: View {
    @StateObject private var viewModel = LoginViewModel()

        var body: some View {
            VStack(spacing: 16) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)

                Button("Submit") {
                    viewModel.submit()
                }
                .buttonStyle(.borderedProminent)
                .disabled(!viewModel.canSubmit)

                Text(viewModel.message)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
}

#Preview {
    MVVM()
}
