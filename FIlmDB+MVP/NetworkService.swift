//
//  NetworkService.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 19.11.2020.
//

import Foundation

protocol NetworkServiceProtocol{
    func getComments(complition: @escaping(Result<[InfoFilm]?, Error>)->Void)
}

class NetworkService: NetworkServiceProtocol{
    func getComments(complition: @escaping (Result<[InfoFilm]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        //let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=c472977fb14ad55f14e1cad1cb66f0b0&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=2018"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ data, _, error in
            if let error = error{
                complition(.failure(error))
                return
            }
            do{
                let obj = try JSONDecoder().decode([InfoFilm].self, from: data!)
                complition(.success(obj))
            } catch {
                complition(.failure(error))
            }
            
        }.resume()
    }
    
    
}
