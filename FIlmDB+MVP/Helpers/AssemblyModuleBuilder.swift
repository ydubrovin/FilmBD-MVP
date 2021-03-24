//
//  ModuleBuilder.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 18.11.2020.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol{
    func createmain(router: RouterProtocol) -> UIViewController
    func createDetailInfoFilm(infoFilm: InfoFilm?,router: RouterProtocol) -> UIViewController
    func createFavorite(router: RouterProtocol)-> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol{
    func createFavorite(router: RouterProtocol) -> UIViewController {
        let view = FavoritesViewController()
        let dataBase = DataBase()
        let presenter = FavoritesPresenter(view: view, router: router, dataBase: dataBase)
        view.presenter = presenter
        return view
    }
    
    
    
    func createmain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = SearchPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    func createDetailInfoFilm(infoFilm: InfoFilm?, router: RouterProtocol) -> UIViewController {
        let view = DetailInfoFilmViewController()
        let dataBase = DataBase()
        let presenter = DatailInfoFilmPresenter(view: view, router: router, infoFilm: infoFilm,dataBase: dataBase)
        view.presenter = presenter
        return view
    }
    
    
}
