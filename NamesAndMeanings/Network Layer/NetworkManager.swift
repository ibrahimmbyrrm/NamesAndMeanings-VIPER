//
//  NetworkManager.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T:Codable>(url : BaseURLS,input : String,type : T.Type,method : HTTPMethod,completion : @escaping(Result<T, HTTPError>)->Void) {
        guard let url = URL(string: "\(url.rawValue)\(input)") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = NetworkHelper.shared.headers
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            self.handler(data: data) { response in
                completion(response)
            }
        }
        dataTask.resume()
    }
    
    func handler<T:Codable>(data : Data, completion : @escaping(Result<T, HTTPError>)->Void) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }catch {
            completion(.failure(.parsingError))
        }
    }
    
}
