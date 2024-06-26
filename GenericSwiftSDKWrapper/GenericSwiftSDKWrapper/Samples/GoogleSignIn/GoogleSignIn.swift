//
//  GoogleSignIn.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//


import SwiftUI
//import GoogleSignInSwift
//import GoogleSignIn

struct GoogleSignInView: View {

    let signInConfig = GIDConfiguration.init(clientID: KGoogle.clientID)

    func googleSignIn() {
        GIDSignIn.sharedInstance.signIn(withPresenting: ) {
           signInResult, error in
           guard error == nil else { return }
           guard let signInResult = signInResult else { return }

           signInResult.user.refreshTokensIfNeeded { user, error in
               guard error == nil else { return }
               guard let user = user else { return }

               let idToken = user.idToken

               //use our ApiClient to receive the idToken then send to our backend
           }
       }
    }

    //When we get token we save the token locally
    // if token is expired , we refresh (we refresh automatically when we try to sign in again )
    // then replace the token

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
        // revoke the tokens assigned to the user , and change state
        //clear keychain
    }

   
}

struct GoogleSignInView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInView()
    }
}
