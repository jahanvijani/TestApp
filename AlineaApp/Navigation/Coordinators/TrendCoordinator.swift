//
//  TrendCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class TrendCoordinator: Coordinator {

    var navigationController: UINavigationController
    var trendViewController: UIViewController?
    
    init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        
        let itemHome = UITabBarItem()
        itemHome.image = UIImage(named: "TrendsIcon")
        self.navigationController.tabBarItem = itemHome
    }
    
    func start() {
        trendViewController = UIViewController()
        guard let trendViewController = trendViewController else { return }
        trendViewController.view.backgroundColor = .gray
        trendViewController.navigationItem.title = "TrendTitle".localized()
        self.navigationController.pushViewController(trendViewController, animated: false)
    }
}
