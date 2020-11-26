//
//  ThemesViewController.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 26/11/2020.
//

import UIKit

class ThemesViewController: UIViewController {

    var viewModel: ThemesViewModel?
    
    fileprivate let collectionView: UICollectionView = {
        
        let padding: CGFloat = 10
        let collectionViewWidth = UIScreen.main.bounds.size.width - (padding * 2)
        let width = (collectionViewWidth / 2) - 5
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: ThemesCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -padding),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
        ])
    }
}

extension ThemesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.themes.count ?? 0
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemesCollectionViewCell.identifier, for: indexPath) as! ThemesCollectionViewCell
        
        if let viewModel = viewModel {
            cell.showThemeDetails(title: viewModel.themes[indexPath.row].title,
                                  image: UIImage(named: "ThemeLogo"))
        }
        
        return cell
    }
}
