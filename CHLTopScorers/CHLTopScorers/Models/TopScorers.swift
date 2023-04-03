//
//  TopScorers.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 11/3/23.
//

import Foundation

struct TopScorers: Decodable {
    let scorers: [Scorer]
}

struct Scorer: Decodable {
    let player: Player
    let team: Team
    let goals: Int
    let assists, penalties: Int?
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
