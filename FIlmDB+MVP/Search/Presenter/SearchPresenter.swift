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
        networkService.getComments{[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result{
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
