//
//  Router.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 25.11.2020.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController?{ get set}
    var assemlyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain{
    func initialViewController()
    func showDetail(infoFilm: InfoFilm?)
    func popToRoot()
}

class Router: RouterProtocol{
    var navigationController: UINavigationController?
    var assemlyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController,assemlyBuilder: AssemblyBuilderProtocol ) {
        self.navigationController = navigationController
        self.assemlyBuilder = assemlyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController{
            guard let mainViewController = assemlyBuilder?.createmain(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(infoFilm: InfoFilm?) {
        if let navigationController = navigationController{
            guard let detailViewController = assemlyBuilder?.createDetailInfoFilm(infoFilm: infoFilm, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController{
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    
    
}
