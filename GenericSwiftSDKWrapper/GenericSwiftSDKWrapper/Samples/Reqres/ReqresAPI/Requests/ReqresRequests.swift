//
//  ReqresApiRequest.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

//                                         ---Data
//request-----client-----server----response
//                                         ___ Error

import Foundation



//create a struct that conforms to the APIRequest ,this allows us to make api calls easier
struct ReqresApiUsersRequest: APIRequest {
    
    //decoding type
    typealias ResponseType = UsersResponse
    
    //url
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
    
    //queryParameters
    var query: [String: APIRequestArgument?]? {
        ["page":"2"]
    }
    
}

struct ReqresApiSingleUserRequest: APIRequest {
    
    typealias ResponseType = User
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}

struct ReqresApiUnkownRequest: APIRequest {
    
    typealias ResponseType = UsersResponse
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users + Endpoints.unknown)!
    }
}

struct ReqresApiRequest: APIRequest {
    
    typealias ResponseType = User
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


struct ReqresApiCreateUserRequest: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.post
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}

struct ReqresApiUpdateUserRequest: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.post
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


struct ReqresApiUpdate_UserRequest: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.patch
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


