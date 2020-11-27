//
//  FavouritesPresenter.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 27.11.2020.
//

import Foundation

protocol FavoritesProtocol:class{
    
}

protocol FavoritesPresenterProtocol:class{
    init (view: FavoritesProtocol, router:RouterProtocol)
}

class FavoritesPresenter: FavoritesPresenterProtocol{
    weak var view: FavoritesProtocol?
    var router: RouterProtocol?
    
    required init(view: FavoritesProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
}
