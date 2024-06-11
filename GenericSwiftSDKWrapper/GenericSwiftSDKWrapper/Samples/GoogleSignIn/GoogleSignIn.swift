//
//  GoogleSignIn.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//


import SwiftUI

struct GoogleSignInView: View {
    
    GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        guard error == nil else { return }
        guard let signInResult = signInResult else { return }

        signInResult.user.refreshTokensIfNeeded { user, error in
            guard error == nil else { return }
            guard let user = user else { return }

            let idToken = user.idToken
            // Send ID token to backend (example below).
        }
    }
    
    func tokenSignInExample(idToken: String) {
        // rewrite it to use our SDK methods
        guard let authData = try? JSONEncoder().encode(["idToken": idToken]) else {
            return
        }
        let url = URL(string: "https://yourbackend.example.com/tokensignin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.uploadTask(with: request, from: authData) { data, response, error in
            // Handle response from your backend.
        }
        task.resume()
    }
    
    func tokenSignOutExample() {
//        revoke the tokens assigned to the user , and change state
        //clear keychain 
    }
    
    var body: some View {
        VStack {
            //use SDKs Methods to fetch token and store token
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct GoogleSignInView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
