//
//  ThemesCollectionViewCell.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    private let themeImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let themeTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = AlineaStyle.Font.smallContentFont
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.backgroundColor = AlineaStyle.ColorPalette.purpleColor
        self.layer.cornerRadius = 10
        
        let stackView   = UIStackView(arrangedSubviews: [themeImageView, themeTitleLabel])
        stackView.axis  =  .vertical
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    // MARK: - show cell details
    func showThemeDetails(title: String, image: UIImage?) {
        
        themeTitleLabel.text = title
        themeImageView.image = image
    }
}
