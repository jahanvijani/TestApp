//
//  HomeCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class HomeCoordinator: Coordinator {

    var navigationController: UINavigationController
    var homeViewController: UIViewController?
    
    init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        
        let itemHome = UITabBarItem()
        itemHome.image = UIImage(named: "homeIcon")
        self.navigationController.tabBarItem = itemHome
    }
    
    func start() {
        homeViewController = UIViewController()
        guard let homeViewController = homeViewController else { return }
        homeViewController.view.backgroundColor = .gray
        homeViewController.navigationItem.title = "HomeTitle".localized()
        self.navigationController.pushViewController(homeViewController, animated: false)
    }
}
