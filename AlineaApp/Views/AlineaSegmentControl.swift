//
//  AlineaSegmentControl.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit


protocol AlineaSegmentControlDelegate: class {
    func didSelectItem(selectedIndex: Int)
}

class AlineaSegmentControl: UIView {
    
    weak var delegate: AlineaSegmentControlDelegate?
    
    private var items: [String]
    private var buttons: [UIButton] = []
    
    init(items: [String]) {
        
        self.items = items
        super.init(frame: .zero)
        
        setupView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.backgroundColor = .clear
        
        let selectedButtonAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 16),
              .foregroundColor: UIColor.purple,
              .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let normalButtonAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 16),
              .foregroundColor: UIColor.black]
        
        for i in 0..<items.count {
            let button = UIButton()
            let normalAttributedString = NSAttributedString(string: items[i], attributes: normalButtonAttributes)
            button.setAttributedTitle(normalAttributedString, for: .normal)
            let selectedAttributedString = NSAttributedString(string: items[i], attributes: selectedButtonAttributes)
            button.setAttributedTitle(selectedAttributedString, for: .selected)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.purple, for: .selected)
            button.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
            button.addRightBorder(.lightGray, width: 1)
            button.tag = i
            buttons.append(button)
        }
        
        buttons[0].isSelected = true
    }
    
    private func setupStackView() {
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTap(_ button: UIButton) {
        for button in buttons {
            button.isSelected = false
        }
        
        button.isSelected = true
        
        self.delegate?.didSelectItem(selectedIndex: button.tag)
    }
}
