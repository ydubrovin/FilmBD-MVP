//
//  DatailInfoFilmPresenter.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 23.11.2020.
//

import Foundation

protocol DatailInfoFilmViewProtocol:class {
    func setInfoFilm(infoFilm: InfoFilm?)
}
protocol DatailInfoFilmViewPresenterProtocol:class{
    init(view: DatailInfoFilmViewProtocol, infoFilm: InfoFilm?)
    func setInfoFilm()
}

class DatailInfoFilmPresenter: DatailInfoFilmViewPresenterProtocol {
    var infoFilm: InfoFilm?
    weak var view: DatailInfoFilmViewProtocol?
    
    required init(view: DatailInfoFilmViewProtocol, infoFilm: InfoFilm?) {
        self.view = view
        self.infoFilm = infoFilm
    }
    
    func setInfoFilm() {
        self.view?.setInfoFilm(infoFilm: infoFilm)
    }
    
    
}
