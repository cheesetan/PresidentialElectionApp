//
//  VotingView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI
import Charts

struct VotingView: View {
    
    @State private var dropImage = Image(systemName: "photo")
    @ObservedObject var candidateManager: CandidateManager = .shared
    
    var body: some View {
        VStack {
            Chart(candidateManager.candidates) { candidate in
                BarMark(
                    x: .value("Votes", candidate.numberOfVotes),
                    y: .value("Name", candidate.name)
                )
                    .annotation(position: .overlay, alignment: .topLeading, spacing: 3) {
                        Text("\(candidate.numberOfVotes)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
            }
            .padding()
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .dropDestination(for: String.self) { items, _ in
                $candidateManager.candidates.forEach { $candidate in
                    if $candidate.id.uuidString == items[0] {
                        $candidate.numberOfVotes.wrappedValue += 1
                    }
                }
                return true
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(candidateManager.candidates) { candidate in
                        candidateView(candidate)
                            .draggable(candidate.id.uuidString)
                    }
                }
            }
            .cornerRadius(8)
            .padding()
            Spacer()
        }
    }
    
    @ViewBuilder
    func candidateView(_ candidate: Candidate) -> some View {
        VStack {
            Text(candidate.name)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .padding(8)
        .background(.blue.opacity(0.7))
        .cornerRadius(8)
    }
}

#Preview {
    VotingView()
}
