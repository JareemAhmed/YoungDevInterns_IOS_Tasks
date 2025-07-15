//
//  NetworkService.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import UIKit

class NetworkService {
    
  static func getProducts(completion: @escaping (Result<GetAllProducts, Error>) -> Void) {
      NetworkManager.fetchData(urlString: NetworkConstant.shared.getProducts, completion: completion)
  }
    
}

