//
//  UsersCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class UsersCoordinator: Coordinator {

    var navigationController: UINavigationController
    var usersViewController: UIViewController?
    
    init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        
        let itemHome = UITabBarItem()
        itemHome.image = UIImage(named: "UsersIcon")
        self.navigationController.tabBarItem = itemHome
    }
    
    func start() {
        usersViewController = UIViewController()
        guard let usersViewController = usersViewController else { return }
        usersViewController.view.backgroundColor = .gray
        usersViewController.navigationItem.title = "UsersTitle".localized()
        self.navigationController.pushViewController(usersViewController, animated: false)
    }
}
