//
//  NetworkConstant.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import Foundation


class NetworkConstant{
    
    static var shared = NetworkConstant()
    var baseUrl = "https://dummyjson.com/"
     var getProducts : String{
        return baseUrl + "products"
    }
}
