//
//  ContentView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CandidatesView()
                .tabItem {
                    Label("Candidates", systemImage: "person")
                }
            VotingView()
                .tabItem {
                    Label("Voting", systemImage: "archivebox")
                }
        }
    }
}

#Preview {
    ContentView()
}
