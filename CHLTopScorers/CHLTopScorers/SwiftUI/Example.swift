//
//  Example.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 3/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var fruits = ["Apple", "Banana", "Orange", "Grapes", "Watermelon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // Register the table view cell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fruitCell")
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Do something when a row is selected
    }
}
