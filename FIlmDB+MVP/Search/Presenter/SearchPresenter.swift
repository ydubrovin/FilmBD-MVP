//
//  SearchPresenter.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 18.11.2020.
//

import Foundation

protocol MainViewProtocol: class{
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments:[InfoFilm]? {get set}
}

class SearchPresenter: MainViewPresenterProtocol{
    var comments: [InfoFilm]?
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view:MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    func getComments() {
        print ("_______________________________")
        print("Presenter")
        var movies = [InfoFilm]()
        networkService.getComments{[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let json):
                    print("мы тут")
                    print(json?["results"].count ?? 0)
                    print(json?["results"][1]["original_title"].stringValue ?? "nil")
                    for i in 0..<(json?["results"].count)!{
                        let bufMovies:InfoFilm = InfoFilm(
                            voteCount: json?["results"][i]["vote_count"].intValue ?? 0,
                            id: json?["results"][i]["id"].intValue ?? 0,
                            video: json?["results"][i]["video"].boolValue ?? false,
                            voteAverage: json?["results"][i]["vote_average"].doubleValue ?? 0.00,
                            title: json?["results"][i]["title"].stringValue ?? "nil",
                            popularity:json?["results"][i]["popularity"].doubleValue ?? 0.00,
                            posterPath: json?["results"][i]["poster_path"].stringValue ?? "nil",
                            originalLanguage: json?["results"][i]["original_language"].stringValue ?? "nil",
                            originalTitle: json?["results"][i]["original_title"].stringValue ?? "nil",
                            backdropPath: json?["results"][i]["backdrop_path"].stringValue ?? "nil",
                            adult: json?["results"][i]["adult"].boolValue ?? false,
                            overview: json?["results"][i]["overview"].stringValue ?? "nil",
                            releaseDate: json?["results"][i]["release_date"].stringValue ?? "nil"
                        )
                        movies.append(bufMovies)
                    }
                    self.comments = movies
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
