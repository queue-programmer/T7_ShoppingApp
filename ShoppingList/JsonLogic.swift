//
//  JsonLogic.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.
//

import Foundation

struct JsonLogic {
    func performRequest(_ url: URL, completion: @escaping ((Result<Items?, Error>) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                        do {
                            let decodedData = try JSONDecoder().decode(Items.self, from: data)
                            print(decodedData.items.count)

                            completion(.success(decodedData))
            
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }.resume()
        }
}
