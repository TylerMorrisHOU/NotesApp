//
//  SignupView.swift
//  NotesApp
//
//  Created by Tyler Morris on 11/17/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isSignedUp: Bool = false

    var body: some View {
        if isSignedUp {
            Text("Account created successfully!")
                .font(.largeTitle)
                .padding()
        } else {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)

                Button(action: {
                    signUpUser(email: email, password: password)
                }) {
                    Text("Register")
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                }
            }
            .padding()
        }
    }

    func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isSignedUp = true
            }
        }
    }
}


#Preview {
    SignupView()
}
