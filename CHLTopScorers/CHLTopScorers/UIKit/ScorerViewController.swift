//
//  ScorerViewController.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 13/3/23.
//

import UIKit

final class ScorerViewController: UIViewController {
    var scorer: Scorer? = nil
    private let tableView: UITableView = UITableView()
    private var scorerInfo: [String] = []
    
    private static let cellID = "scorerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = scorer?.player.name ?? ""
        scorerInfo = scorer?.info() ?? []
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ScorerViewController.cellID)
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

extension ScorerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scorerInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScorerViewController.cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let info = scorerInfo[indexPath.row]
        content.text = info
        cell.contentConfiguration = content
        return cell
    }
    

}

extension Scorer {
    func info() -> [String] {
        var items: [String] = []
        items.append("Name: \(player.name)")
        items.append("Position: \(player.position.rawValue)")
        items.append("Date of birth: \(player.dateOfBirth)")
        items.append("Nationality: \(player.nationality)")
        if let shirtNumber = player.shirtNumber {
            items.append("Shirt number: \(shirtNumber)")
        }
        items.append("Team: \(team.name)")
        items.append("Goals: \(goals)")
        if let assists {
            items.append("Assists: \(assists)")
        }
        if let penalties {
            items.append("Penalties: \(penalties)")
        }
        return items
    }
}
