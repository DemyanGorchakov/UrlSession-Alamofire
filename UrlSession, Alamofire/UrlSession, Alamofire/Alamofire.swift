//
//  Alamofire.swift
//  UrlSession, Alamofire
//
//  Created by Демьян on 16.04.2024.
//

import Foundation

import Foundation
import Alamofire

class Alamofire {
    
    func getRequest(keyWord: String?, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=\(keyWord)") else { return }
        let headers: HTTPHeaders = ["X-API-KEY": "72eccbb8-5e3d-41f7-9cc7-633490e25cfa"]
        
        AF.request(url, method: .get, headers: headers).response { data in
            if let data = data.data {
                completion(data)
            }
        }
    }
    
}
