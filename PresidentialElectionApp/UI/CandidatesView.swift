//
//  CandidatesView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI

struct CandidatesView: View {
    @ObservedObject var candidateManager: CandidateManager = .shared
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(candidateManager.candidates, id: \.id) { candidate in
                        candidateListItem(candidate)
                    }
                }
            }
        }
        .onAppear {
           loadCandidates()
        }
    }
    
    @ViewBuilder
    func candidateListItem(_ candidate: Candidate) -> some View {
        VStack(alignment: .leading) {
            Text(candidate.name)
                .font(.title3)
            Text("\(candidate.age)")
                .font(.footnote)
        }
    }
    
    func loadCandidates() {
//        if candidateManager.candidates.count == 0 {
            candidateManager.candidates = Candidate.candidateSamples
//        }
    }
}

#Preview {
    CandidatesView()
}
