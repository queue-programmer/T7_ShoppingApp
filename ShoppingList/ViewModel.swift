//
//  ViewModel.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var shoppingCart: [Item]?
    
    let jsonLogic: JsonLogic = JsonLogic()
    
    //let url: String = "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"
    
    init(){
        loadShoppingCart()
    }
    
    func loadShoppingCart() {
        if let url = URL(string: "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"){
            jsonLogic.performRequest(url){
                [weak self] result in
                self?.recieveData(result: result)
            }
        }
    }
    
    private func recieveData(result: Result<Items?, Error>) {
        switch result{
        case .success(let items):
            DispatchQueue.main.async { [weak self] in
                self?.shoppingCart = items?.items
            }
        case .failure(let error):
            print(error)
        }
    }
}

//private func performRequest(_ url: URL, completion: @escaping ((Result<WeatherCondition?, Error>) -> Void)) {
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        if let error = error {
//            completion(.failure(error))
//            return
//        }
//
//        if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
//            completion(.failure(NetworkError.failedRequest))
//            return
//        }
//
//        if let data = data {
//            do {
//                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
//                guard let id = decodedData.weather.first?.id else {
//                    completion(.failure(NetworkError.failedJson))
//                    return
//                }
//
//                let name = decodedData.name
//                let temperature = decodedData.main.temp
//
//
//                let weatherCondition = WeatherCondition(conditionId: id,
//                                                        cityName: name,
//                                                        temperature: temperature)
//                completion(.success(weatherCondition))
//
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }.resume()
//}
