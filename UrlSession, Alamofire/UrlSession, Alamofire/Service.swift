//
//  Service.swift
//  UrlSession, Alamofire
//
//  Created by Демьян on 16.04.2024.
//

import Foundation

class Service {
    
    func getRequest(keyWord: String?, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=\(keyWord)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["X-API-KEY" : "72eccbb8-5e3d-41f7-9cc7-633490e25cfa"]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    completion(.success(data))
                }
            }
        }
        task.resume()
    }
    
}
