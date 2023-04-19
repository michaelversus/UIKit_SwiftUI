//
//  TopScorers.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 11/3/23.
//

import Alamofire

enum Auth {
    static let headers: HTTPHeaders = [
        "X-Auth-Token": "d682a98a0cb94edd82a78975ca433686"
    ]
}

enum TopScorersAPI {
    static let url = "http://api.football-data.org/v4/competitions/2001/scorers"
}

struct TopScorers: Decodable {
    let scorers: [Scorer]
}

struct Scorer: Decodable {
    let player: Player
    let team: Team
    let goals: Int
    let assists, penalties: Int?
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

struct Player: Decodable {
    let id: Int
    let name, firstName: String
    let lastName: String?
    let dateOfBirth, nationality: String
    let position: Position
    let shirtNumber: Int?
}

enum Position: String, Decodable {
    case midfield = "Midfield"
    case offence = "Offence"
}

struct Team: Decodable {
    let id: Int
    let name, shortName, tla: String
    let crest: String
    let address: String
    let website: String
    let founded: Int
    let clubColors: String?
    let venue: String
}
