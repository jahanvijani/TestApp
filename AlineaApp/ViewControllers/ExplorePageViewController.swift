//
//  ExplorePageViewController.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 24/11/2020.
//

import UIKit

enum Items: String {
    case category = "Category"
    case themes = "Themes"
    case trending = "Trending"
}

class ExplorePageViewController: UIViewController {
    
    var exploreViews:[UIViewController] = []
    var segmentControl:AlineaSegmentControl?
    
    let categoryViewController = CategoryViewController()
    let themesViewController = ThemesViewController()
    let trendingViewController = TrendingViewController()
    
    var themesViewModel: ThemesViewModel?
    var trendingViewModel: TrendingViewModel?
    
    let padding: CGFloat = 10.0
    
    var topBarHeight: CGFloat {
        var statusBarHeight: CGFloat = 0.0
        
        if #available(iOS 13, *) {
            statusBarHeight = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0.0
        
        return statusBarHeight + navigationBarHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "ExploreTitle".localized()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .compose)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        
        setupViewControllers()
        setupSegmentControl()
        setupConstraints()
    }
    
    private func setupViewControllers() {
        categoryViewController.view.translatesAutoresizingMaskIntoConstraints = false
        categoryViewController.view.isHidden = false
        self.view.addSubview(categoryViewController.view)
        
        themesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        themesViewController.viewModel = themesViewModel
        themesViewController.view.isHidden = true
        self.view.addSubview(themesViewController.view)
        
        trendingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        trendingViewController.viewModel = trendingViewModel
        trendingViewController.view.isHidden = true
        self.view.addSubview(trendingViewController.view)
        
        exploreViews = [categoryViewController, themesViewController, trendingViewController]
    }
    
    private func setupSegmentControl() {
        
        segmentControl = AlineaSegmentControl(items: [Items.category.rawValue, Items.themes.rawValue, Items.trending.rawValue])
        guard let segmentControl = segmentControl else { return }
        segmentControl.delegate = self
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentControl)
    }
    
    private func setupConstraints() {
        
        guard let segmentControl = segmentControl else { return }
        
        let topMargin = topBarHeight
        
        NSLayoutConstraint.activate([
            
            segmentControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topMargin),
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor),
            segmentControl.heightAnchor.constraint(equalToConstant: 50),
            
            categoryViewController.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: padding),
            categoryViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoryViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -topMargin),
            
            themesViewController.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: padding),
            themesViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            themesViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            themesViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -topMargin),
            
            trendingViewController.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: padding),
            trendingViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            trendingViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            trendingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -topMargin)
        ])
        
    }
}

extension ExplorePageViewController: AlineaSegmentControlDelegate {
    
    func didSelectItem(selectedIndex: Int) {
        
        for viewController in exploreViews {
            viewController.view.isHidden = true
        }
        
        exploreViews[selectedIndex].view.isHidden = false
    }
}



