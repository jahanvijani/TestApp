//
//  CaregoryTableViewCell.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class CaregoryTableViewCell: UITableViewCell {

    private let categoryButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = AlineaStyle.Font.contentFont
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(categoryButton)
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            
            categoryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            categoryButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
            categoryButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            categoryButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        self.bottomAnchor.constraint(greaterThanOrEqualTo: categoryButton.bottomAnchor, constant: padding).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCategory(category:ButtonCategory) {
        
        let image = UIImage(named: "common")
        categoryButton.setImage(image, for: .normal)
        categoryButton.contentHorizontalAlignment = .left
        categoryButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        categoryButton.titleEdgeInsets.left = 20
                
        switch category {
        case .stocks:
            categoryButton.backgroundColor = .purple
            categoryButton.setTitle(ButtonCategory.stocks.rawValue, for: .normal)
        case .ETFs:
            categoryButton.backgroundColor = .blue
            categoryButton.setTitle(ButtonCategory.ETFs.rawValue, for: .normal)
        case .crypto:
            categoryButton.backgroundColor = AlineaStyle.ColorPalette.cryptoColor
            categoryButton.setTitle(ButtonCategory.crypto.rawValue, for: .normal)
        }
    }

}
