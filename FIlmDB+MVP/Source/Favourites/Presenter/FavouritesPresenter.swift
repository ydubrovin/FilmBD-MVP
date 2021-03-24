//
//  FavouritesPresenter.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 27.11.2020.
//

import Foundation

protocol FavoritesViewProtocol:class{
    //MARK: переименовать так как удаляем конкретный элемент
    func deleteDataBase(at:Int64)
    func refreshData()
}

protocol FavoritesPresenterProtocol:class{
    init (view: FavoritesViewProtocol, router:RouterProtocol, dataBase: DataBaseProtocol)
    var favoritesInfoFilm: [InfoFilm]{get set}
    func deleteDataBase(at:Int64)
    func refreshData()
}

class FavoritesPresenter: FavoritesPresenterProtocol{
    weak var view: FavoritesViewProtocol?
    var router: RouterProtocol?
    var favoritesInfoFilm: [InfoFilm]
    let dataBase: DataBaseProtocol!
    
    required init(view: FavoritesViewProtocol, router: RouterProtocol, dataBase:DataBaseProtocol) {
        self.view = view
        self.router = router
        self.dataBase = dataBase
        favoritesInfoFilm = dataBase.getData()
        print(favoritesInfoFilm)
    }
    func deleteDataBase(at: Int64) {
        self.dataBase.deleteOneData(deleteID: at)
    }
    func refreshData() {
        favoritesInfoFilm = dataBase.getData()
    }
    
}
