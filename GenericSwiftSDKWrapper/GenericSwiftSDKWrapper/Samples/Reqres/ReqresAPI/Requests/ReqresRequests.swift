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
struct ReqresApiUsers: APIRequest {
    
    typealias ResponseType = UsersResponse
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
    var query: [String: APIRequestArgument?]? {
        ["page":"2"]
    }
}

struct ReqresApiSingleUser: APIRequest {
    
    typealias ResponseType = User
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}

struct ReqresApiUnkown: APIRequest {
    
    typealias ResponseType = UsersResponse
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users + Endpoints.unknown)!
    }
}

struct ReqresApi: APIRequest {
    
    typealias ResponseType = User
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


struct ReqresApiCreateUser: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.post
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}

struct ReqresApiUpdateUser: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.post
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


struct ReqresApiUpdate_User: APIRequest {
    
    typealias ResponseType = User
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.patch
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.users)!
    }
}


