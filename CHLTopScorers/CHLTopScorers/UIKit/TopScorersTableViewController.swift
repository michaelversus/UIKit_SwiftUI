//
//  TopScorersTableViewController.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 11/3/23.
//

import UIKit
import Alamofire

final class TopScorersTableViewController: UIViewController {
    private static let cellID = "playerCellID"
    private var scorers: [Scorer] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Champions League Top Scorers"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TopScorersTableViewController.cellID)
        fetchPlayers()
    }
    
    func fetchPlayers() {
        AF
        .request(
            TopScorersAPI.url,
            method: .get,
            headers: Auth.headers
        ).responseDecodable(
            of: TopScorers.self
        ) { [weak self] response in
            do {
                let model = try response.result.get()
                self?.scorers = model.scorers
                self?.tableView.reloadData()
            } catch {
                debugPrint("error: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension TopScorersTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scorers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopScorersTableViewController.cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let scorer = scorers[indexPath.row]
        content.text = scorer.player.name
        content.secondaryText = scorer.secondaryText
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scorer = scorers[indexPath.row]
        let vc = ScorerViewController()
        vc.scorer = scorer
        navigationController?.pushViewController(vc, animated: true)
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}
