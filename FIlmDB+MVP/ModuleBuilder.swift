//
//  ModuleBuilder.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 18.11.2020.
//

import Foundation
import UIKit

protocol Builder{
    static func createmain() -> UIViewController
    static func createDetailInfoFilm(infoFilm: InfoFilm?) -> UIViewController
}

class ModuleBuilder: Builder{
    
    
    static func createmain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = SearchPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    static func createDetailInfoFilm(infoFilm: InfoFilm?) -> UIViewController {
        let view = DetailInfoFilmViewController()
        let presenter = DatailInfoFilmPresenter(view: view, infoFilm: infoFilm)
        view.presenter = presenter
        return view
    }
    
    
}
