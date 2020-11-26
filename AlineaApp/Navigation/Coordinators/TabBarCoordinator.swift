//
//  TabBarCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 24/11/2020.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    let window: UIWindow
    var tabBarViewController: UITabBarController?

    init(window: UIWindow) {
        self.window = window
        
        tabBarViewController = UITabBarController()
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator.start()
        
        let exploreNavigationController = UINavigationController()
        let exploreCoordinator = ExploreCoordinator(navigationController: exploreNavigationController)
        exploreCoordinator.start()
        
        let trendNavigationController = UINavigationController()
        let trendCoordinator = TrendCoordinator(navigationController: trendNavigationController)
        trendCoordinator.start()
        
        let usersNavigationController = UINavigationController()
        let usersCoordinator = UsersCoordinator(navigationController: usersNavigationController)
        usersCoordinator.start()
        
        let ideaNavigationController = UINavigationController()
        let ideaCoordinator = IdeaCoordinator(navigationController: ideaNavigationController)
        ideaCoordinator.start()
        
        tabBarViewController?.viewControllers = [homeNavigationController, exploreNavigationController, trendNavigationController, usersNavigationController, ideaNavigationController]
        
        tabBarViewController?.selectedIndex = 1
    }
    
    func start() {
        guard let tabBarViewController = tabBarViewController else { return }
        self.window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
    }
}
