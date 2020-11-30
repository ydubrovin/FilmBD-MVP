//
//  DatailInfoFilmPresenter.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 23.11.2020.
//

import Foundation

protocol DatailInfoFilmViewProtocol:class {
    func setInfoFilm(infoFilm: InfoFilm?)
    func saveDataBase()
}
protocol DatailInfoFilmViewPresenterProtocol:class{
    init(view: DatailInfoFilmViewProtocol, router: RouterProtocol ,infoFilm: InfoFilm?, dataBase: DataBaseProtocol)
    func setInfoFilm()
    func tap()
    var infoFilm:InfoFilm?{get set}
    func saveDataBase()
}

class DatailInfoFilmPresenter: DatailInfoFilmViewPresenterProtocol {
    
    var infoFilm: InfoFilm?
    weak var view: DatailInfoFilmViewProtocol?
    var router: RouterProtocol?
    var dataBase: DataBaseProtocol!
    
    required init(view: DatailInfoFilmViewProtocol, router: RouterProtocol,  infoFilm: InfoFilm?, dataBase: DataBaseProtocol) {
        self.view = view
        self.infoFilm = infoFilm
        self.router = router
        self.dataBase = dataBase
    }
    
    func setInfoFilm() {
        self.view?.setInfoFilm(infoFilm: infoFilm)
    }
    
    
    func tap() {
        router?.popToRoot()
    }
    
    func saveDataBase() {
        // MARK: - Исправить self.infofilm! не безопасно
        dataBase.saveData(infoFilm: self.infoFilm!)
    }
    
}
