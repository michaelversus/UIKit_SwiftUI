//
//  TopScorersView.swift
//  CHLTopScorers
//
//  Created by Michalis Karagiorgos L on 3/4/23.
//

import SwiftUI

struct TopScorersView: View {
    @State private var scorers: [Scorer] = []
    
    var body: some View {
        NavigationStack {
            List(scorers) { scorer in
                NavigationLink {
                    ScorerView(scorer: scorer)
                } label: {
                    TopScorerViewCell(scorer: scorer)
                }
            }
            .navigationTitle("Ch. L. Top Scorers")
        }
        .task {
            do {
                let request = try URLRequest(
                    url: TopScorersAPI.url,
                    method: .get,
                    headers: Auth.headers
                )
                let (data, _) = try await URLSession.shared.data(for: request)
                let object = try JSONDecoder().decode(TopScorers.self, from: data)
                scorers = object.scorers
            } catch {
                scorers = []
            }
        }
    }
}

struct TopScorerViewCell: View {
    let scorer: Scorer
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scorer.player.name)
                .font(.headline)
            Text(scorer.secondaryText)
                .font(.subheadline)
        }
    }
}

extension Scorer: Identifiable {
    var id: Int {
        player.id
    }
}

extension Scorer {
    var secondaryText: String {
        let shirtNumber = (player.shirtNumber ?? 0)
        let shirt = shirtNumber != 0 ? "\(shirtNumber)" : "-"
        return "Goals: \(goals) - Shirt number: \(shirt)"
    }
}

// Preview

struct TopScorersView_Previews: PreviewProvider {
    static var previews: some View {
        TopScorersView()
    }
}
