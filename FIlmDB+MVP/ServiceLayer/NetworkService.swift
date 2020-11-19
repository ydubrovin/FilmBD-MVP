//
//  NetworkService.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 19.11.2020.
//


import Foundation

protocol NetworkServiceProtocol{
    func getComments(complition: @escaping(Result<[InfoFilm]?,Error>)-> Void)
}

class NetworkService: NetworkServiceProtocol{
    func getComments(complition: @escaping (Result<[InfoFilm]?, Error>) -> Void) {
        let urlString = "сюда мой юрл"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let error = error{
                complition(.failure(error))
                return
            }
            do{
                let obj = try JSONDecoder().decode([InfoFilm].self, from: data!)
                complition(.success(obj))
            } catch{
                complition(.failure(error))
            }
        }.resume()
    }
    
    
}
