//
//  Oauth2Client.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation
import SwiftUI
import OAuthSwift

struct OAuthView: View {
    @State private var isAuthorized = false
    let oauthswift = OAuth2Swift(
        consumerKey: "YOUR_CLIENT_ID",
        consumerSecret: "YOUR_CLIENT_SECRET",
        authorizeUrl: "AUTHORIZATION_SERVER_URL",
        accessTokenUrl: "TOKEN_SERVER_URL",
        responseType: "code"
    )
    
    var body: some View {
        VStack {
            if isAuthorized {
                Text("You are authorized!")
            } else {
                Button(action: {
                    self.oauthswift.authorizeURLHandler = SafariURLHandler(viewController: UIApplication.shared.windows.first!.rootViewController!)
                    let _ = self.oauthswift.authorize(
                        withCallbackURL: URL(string: "YOUR_CALLBACK_URL")!,
                        scope: "SCOPE",
                        state: "STATE",
                        success: { credential, response, parameters in
                            self.isAuthorized = true
                        },
                        failure: { error in
                            print(error.localizedDescription)
                        }
                    )
                }) {
                    Text("Authenticate")
                }
            }
        }
    }
}

struct OauthView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthView()
    }
}

