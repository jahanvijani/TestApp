//
//  AppCoordinator.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 24/11/2020.
//

import UIKit

class AppCoordinator: Coordinator {

    let window: UIWindow
    var tabBarCoordinator: TabBarCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        tabBarCoordinator = TabBarCoordinator(window: self.window)
        tabBarCoordinator?.start()
    }
}
