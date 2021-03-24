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
    var tabBarController: UITabBarController? {get set}
}

protocol RouterProtocol: RouterMain{
    func initialViewController()
    func showDetail(infoFilm: InfoFilm?)
    func popToRoot()
}

class Router: RouterProtocol{
    var navigationController: UINavigationController?
    var assemlyBuilder: AssemblyBuilderProtocol?
    var tabBarController: UITabBarController?
    
    init(tabBarController:UITabBarController,assemlyBuilder: AssemblyBuilderProtocol ) {
        self.navigationController = UINavigationController()
        self.tabBarController = tabBarController
        self.assemlyBuilder = assemlyBuilder
    }
    
    func initialViewController() {
//        if let navigationController = navigationController{
//            guard let mainViewController = assemlyBuilder?.createmain(router: self) else { return }
//            navigationController.viewControllers = [mainViewController]
//        }
        if let tabBar = tabBarController{
            guard let firstVC = assemlyBuilder?.createmain(router: self) else {return}
            guard let secondVC = assemlyBuilder?.createFavorite(router: self) else {return}
            secondVC.loadViewIfNeeded()
            firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
            secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
            if let navigation = navigationController{
                navigation.pushViewController(firstVC, animated: true)
                tabBarController?.setViewControllers([navigation,UINavigationController(rootViewController: secondVC)], animated: true)
            }
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
