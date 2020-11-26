//
//  ExploreCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class ExploreCoordinator: Coordinator {

    var navigationController: UINavigationController
    var exploreViewController: ExplorePageViewController?
    
    
    init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        
        let itemExplore = UITabBarItem()
        itemExplore.image = UIImage(named: "explore")
        self.navigationController.tabBarItem = itemExplore
    }
    
    func start() {
        exploreViewController = ExplorePageViewController()
        guard let exploreViewController = exploreViewController else { return }
        
        let themesViewModel = ThemesViewModel()
        exploreViewController.themesViewModel = themesViewModel
        let trendingViewModel = TrendingViewModel()
        exploreViewController.trendingViewModel = trendingViewModel
        self.navigationController.viewControllers = [exploreViewController]
    }
}
