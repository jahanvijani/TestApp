//
//  TrendingViewController.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 26/11/2020.
//

import UIKit

enum Section: String {
    case topGainer = "Top Gainers"
    case topSeller = "Top Sellers"
}

class TrendingViewController: UIViewController {

    var viewModel: TrendingViewModel?

    private var tableView = UITableView(frame: .zero, style: .grouped)
    
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
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
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
extension TrendingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel?.topGainers.count ?? 0
        }
        return viewModel?.topSellers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return Section.topGainer.rawValue
        case 1:
            return Section.topSeller.rawValue
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        
        var trendingItem: Trending
        if let viewModel = viewModel {
            if indexPath.section == 0 {
                trendingItem = viewModel.topGainers[indexPath.row]
            } else {
                trendingItem = viewModel.topSellers[indexPath.row]
            }
            cell.showDetails(trending: trendingItem)
        }
        return cell
    }
}

// MARK: - UITableView Delegate
extension TrendingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

