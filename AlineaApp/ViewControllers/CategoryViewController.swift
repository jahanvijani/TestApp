//
//  CategoryViewController.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import UIKit

enum ButtonCategory: String {
    case stocks = "Stocks"
    case ETFs = "ETFs"
    case crypto = "Crypto"
}

class CategoryViewController: UIViewController {

    private var tableView = UITableView()
    
    private var dataSource = [ButtonCategory.stocks.rawValue,
                              ButtonCategory.ETFs.rawValue,
                              ButtonCategory.crypto.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .gray
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CaregoryTableViewCell.self, forCellReuseIdentifier: CaregoryTableViewCell.identifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}


// MARK: - UITableView Data Source
extension CategoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CaregoryTableViewCell.identifier, for: indexPath) as! CaregoryTableViewCell
        
        if let category = ButtonCategory(rawValue: dataSource[indexPath.row]) {
            cell.setCategory(category: category)
        }
        
        return cell
    }
}

// MARK: - UITableView Delegate
extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
