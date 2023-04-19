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
    
    @IBOutlet weak var uiKitButton: UIButton!
    @IBOutlet weak var swiftUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Options"
    }
    
    @IBAction func uiKitButtonTapped(_ sender: Any) {
        let topScorersTableViewController = TopScorersTableViewController()
        navigationController?.pushViewController(topScorersTableViewController, animated: true)
    }
    
    @IBAction func swiftUIButtonTapped(_ sender: Any) {
        let host = UIHostingController(rootView: TopScorersView())
        host.navigationItem.title = "Champions League Top Scorers"
        navigationController?.present(host, animated: true)
    }
}
