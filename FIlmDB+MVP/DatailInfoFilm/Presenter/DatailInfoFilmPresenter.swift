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
    init(view: DatailInfoFilmViewProtocol, router: RouterProtocol ,infoFilm: InfoFilm?)
    func setInfoFilm()
    func tap()
}

class DatailInfoFilmPresenter: DatailInfoFilmViewPresenterProtocol {
    
    var infoFilm: InfoFilm?
    weak var view: DatailInfoFilmViewProtocol?
    var router: RouterProtocol?
    
    required init(view: DatailInfoFilmViewProtocol, router: RouterProtocol,  infoFilm: InfoFilm?) {
        self.view = view
        self.infoFilm = infoFilm
        self.router = router
    }
    
    func setInfoFilm() {
        self.view?.setInfoFilm(infoFilm: infoFilm)
    }
    
    
    func tap() {
        router?.popToRoot()
    }
}
