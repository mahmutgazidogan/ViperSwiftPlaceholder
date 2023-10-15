//
//  HomeInteractor.swift
//  ViperSwiftPlaceholder
//
//  Created by Mahmut Gazi Doğan on 11.10.2023.
//

import Foundation
import Alamofire

final class HomeInteractor {
    
    // Async await
    
    func fetchCats(url: String, onResponse: @escaping (Result<[CatEntity], Error>) -> Void) {
        AF.request(url,
                   method: .get).validate().responseDecodable(of: [CatEntity].self) { response in
            guard let model = response.value else {
                guard let error = response.error else {
                    // Exception
                    return
                }
                onResponse(.failure(error))
                return
            }
            onResponse(.success(model))
        }
    }

}

enum ServicePath: String {
    case http = "/http.json"
}
