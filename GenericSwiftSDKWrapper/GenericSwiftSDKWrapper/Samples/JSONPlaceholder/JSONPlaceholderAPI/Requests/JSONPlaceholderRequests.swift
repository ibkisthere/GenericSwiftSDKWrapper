//
//  JSONPlaceholderApiRequest.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

//                                         ---Data
//request-----client-----server----response
//                                         ___ Error

import Foundation



//create a struct that conforms to the APIRequest ,this allows us to make api calls easier
struct GetPosts: APIRequest {
    
    //decoding type
    typealias ResponseType =  [Post]
    
    //url
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.posts)!
    }

}

struct GetOnePost: APIRequest {
    
    typealias ResponseType = [Post]
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.posts)!
    }
    
    var query: [String : APIRequestArgument?]? {
        ["postId":"1"]
    }
}

struct UpdatePost: APIRequest {
    
    typealias ResponseType = [Post]
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.patch
    }
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.posts)!
    }
}

struct DeletePost: APIRequest {
    
    typealias ResponseType = [Post]
    
    var httpMethod: APIRequestMethod {
        APIRequestMethod.delete
    }
    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.posts)!
    }
}


struct GetComments: APIRequest {
    
    typealias ResponseType = [Comment]

    
    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.comments)!
    }
}

struct GetAlbums: APIRequest {
    
    typealias ResponseType = [Album]
    

    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.albums)!
    }
}


struct GetPhotos: APIRequest {
    
    typealias ResponseType = [Photo]

    var url: URL {
        URL(string: Endpoints.apiBase + Endpoints.photos)!
    }
}


