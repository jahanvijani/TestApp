//
//  TrendTableViewCell.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 26/11/2020.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    private let padding: CGFloat = 10
    
    private let trendImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let detailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let valueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textColor = .white
        label.font = AlineaStyle.Font.contentFont
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(trendImageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            
            trendImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            trendImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
            trendImageView.widthAnchor.constraint(equalToConstant: 40),
            trendImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            titleLabel.leftAnchor.constraint(equalTo: trendImageView.rightAnchor, constant: padding),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            detailLabel.leftAnchor.constraint(equalTo: trendImageView.rightAnchor, constant: padding),
            detailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            valueLabel.widthAnchor.constraint(equalToConstant: 80),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.bottomAnchor.constraint(greaterThanOrEqualTo: detailLabel.bottomAnchor, constant: padding)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showDetails(trending: Trending?) {
        guard let trending = trending else { return }
        
        trendImageView.image =  UIImage(named: "TrendCellIcon")
        titleLabel.text = trending.title
        detailLabel.text = trending.description
        valueLabel.text = String(trending.value)
        
        if trending.value > 0 {
            valueLabel.backgroundColor = .green
        } else {
            valueLabel.backgroundColor = .red
        }
    }
}
