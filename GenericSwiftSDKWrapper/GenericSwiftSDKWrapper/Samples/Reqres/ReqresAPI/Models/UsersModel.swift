//
//  ReqresApiUsersModel.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 12/06/2024.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL
}

// Define the data model for the response
struct UsersResponse: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
    let support: Support
}

// Define the data model for the support information
struct Support: Codable {
    let url: URL
    let text: String
}
