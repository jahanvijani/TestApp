//
//  IdeaCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class IdeaCoordinator: Coordinator {

    var navigationController: UINavigationController
    var ideaViewController: UIViewController?
    
    init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        
        let itemHome = UITabBarItem()
        itemHome.image = UIImage(named: "IdeaIcon")
        self.navigationController.tabBarItem = itemHome
    }
    
    func start() {
        ideaViewController = UIViewController()
        guard let ideaViewController = ideaViewController else { return }
        ideaViewController.view.backgroundColor = .gray
        ideaViewController.navigationItem.title = "IdeaTitle".localized()
        self.navigationController.pushViewController(ideaViewController, animated: false)
    }
}
