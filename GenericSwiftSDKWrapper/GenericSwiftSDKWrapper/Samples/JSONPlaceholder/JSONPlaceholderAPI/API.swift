//
//  APIRequests.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation



// this class is just to list all the methods we created 
public class JSONPlaceholderAPI {
    
    let client = JSONPlaceholderApiClient()
    
    public func getUsers () {
//        ReqresApiUsersRequest().send(
//            to: client, completion: {
//                result in
//               switch result {
//                   case .success(let response):
//                       print("this is the response \(response)")
//                   case .failure(let error):
//                       print("this is the error \(error)")
//                 }
//           })
    }

    public func authorize () {
        
    }

    public func register () {

    }
    
//    all of them return their completion handlers

}


//
//send(to: client, completion: {
//    result in
//switch result {
//    case .success(let response):
//        print("this is the response \(response)")
//    case .failure(let error):
//        print(
//  }
//})
