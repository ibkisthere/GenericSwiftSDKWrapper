//
//  ReqresApiUsersModel.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 12/06/2024.
//



struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}


struct Album : Codable {
    let userId: Int
    let id: Int
    let title: String
}

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}


