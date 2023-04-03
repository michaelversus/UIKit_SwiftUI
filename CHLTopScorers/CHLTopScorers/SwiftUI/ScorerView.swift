//
//  ScorerView.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 3/4/23.
//

import SwiftUI

struct ScorerView: View {
    let scorer: Scorer
    
    var body: some View {
        List(scorer.info(), id: \.self) { text in
            Text(text)
        }
        .navigationTitle(scorer.player.name)
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        ScorerView(scorer: .mock())
    }
}

extension Scorer {
    static func mock() -> Scorer {
        Scorer(
            player: .mock(),
            team: .mock(),
            goals: 4,
            assists: 5,
            penalties: 2
        )
    }
}

extension Player {
    static func mock() -> Player {
        Player(
            id: 2,
            name: "Messi",
            firstName: "Leo",
            lastName: "Messi",
            dateOfBirth: "01/01/01",
            nationality: "Argentinian",
            position: .offence,
            shirtNumber: 10
        )
    }
}

extension Team {
    static func mock() -> Team {
        Team(
            id: 10,
            name: "PSG",
            shortName: "PSG",
            tla: "tla",
            crest: "crest",
            address: "address",
            website: "psg",
            founded: 1010,
            clubColors: "blue",
            venue: "Paris"
        )
    }
}
