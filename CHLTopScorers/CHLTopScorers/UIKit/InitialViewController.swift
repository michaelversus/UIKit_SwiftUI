//
//  InitialViewController.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 11/3/23.
//

import UIKit
import SwiftUI

enum ElementOption: String {
    case uiKit = "UIKit"
    case swiftUI = "SwiftUI"
}

final class InitialViewController: UIViewController {
    private static let cellID = "basicCell"
    private let tableView: UITableView = UITableView()
    private let elements: [ElementOption] = [.uiKit, .swiftUI]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Options"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: InitialViewController.cellID)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialViewController.cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = elements[indexPath.row].rawValue
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = elements[indexPath.row]
        tableView.cellForRow(at: indexPath)?.isSelected = false
        switch option {
        case .uiKit :
            let topScorersTableViewController = TopScorersTableViewController()
            navigationController?.pushViewController(topScorersTableViewController, animated: true)
        case .swiftUI :
            let host = UIHostingController(rootView: TopScorersView())
//            host.navigationItem.title = "Champions League Top Scorers"
            navigationController?.present(host, animated: true)
        }
    }
}
