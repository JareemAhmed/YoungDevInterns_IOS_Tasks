//
//  NetworkManager.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import Foundation
class NetworkManager {
  static func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: urlString) else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = ApiType.GET.rawValue
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
        DecodingService.decodeJSON(data: data ?? Data(), completion: completion)
    }
    task.resume()
  }
}
