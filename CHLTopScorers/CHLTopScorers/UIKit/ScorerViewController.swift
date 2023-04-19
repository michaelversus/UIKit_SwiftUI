//
//  ScorerViewController.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 13/3/23.
//

import UIKit

final class ScorerViewController: UIViewController {
    private static let cellID = "scorerCell"
    var scorer: Scorer? = nil
    private var scorerInfo: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = scorer?.player.name ?? ""
        scorerInfo = scorer?.info() ?? []
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ScorerViewController.cellID)
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
