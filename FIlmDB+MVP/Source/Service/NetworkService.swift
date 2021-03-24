//
//  NetworkService.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 19.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkServiceProtocol{
    func getComments(completion: @escaping (Result<JSON?, Error>)->Void )
}

class NetworkService: NetworkServiceProtocol{
    func getComments(completion: @escaping (Result<JSON?, Error>)->Void)  {
        let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=c472977fb14ad55f14e1cad1cb66f0b0&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=2018"
        AF.request(urlString).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            switch response.result{
            case .success:
                print("sedsds")
                let myJSON = JSON(response.value  ?? "nil")
                print(myJSON["results"][1]["original_title"].stringValue)
                print(myJSON.count)
                completion(.success(myJSON))
    
            case let .failure(error):
                print ("______________________________________")
                print ("Error\(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
