//
//  ReqresViewModel.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 12/06/2024.
//

import SwiftUI
import Combine

class ReqresViewModel: ObservableObject {
    @Published var response: String? = nil
    @Published var error: String? = nil
    
    let client = ReqresApiClient()
    
    func fetchUsers() {
        ReqresApiUsersRequest().send(to: client) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.response = "this is the response \(response)"
                case .failure(let error):
                    self?.error = "this is the error \(error)"
                }
            }
        }
    }
}
