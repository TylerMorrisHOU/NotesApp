//
//  LoginView.swift
//  NotesApp
//
//  Created by Tyler Morris on 11/17/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            if isLoggedIn {
                ContentView()
            } else {
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $password)

                    Button(action: {
                        loginUser(email: email, password: password)
                    }) {
                        Text("Login")
                            .padding()
                    }

                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                    }
                    NavigationLink {
                        SignupView()
                    } label: {
                        Text("Register")
                    }
                }
                .padding()
                .navigationTitle("Login")
            }
        }
    }

    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    LoginView()
}
