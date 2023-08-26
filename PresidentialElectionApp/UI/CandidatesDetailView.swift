//
//  CandidatesDetailView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI

struct CandidatesDetailView: View {
    
    @Binding var candidate: Candidate
    
    var body: some View {
        Form {
            Section {
                TextField("Candidate's name", text: $candidate.name)
                HStack {
                    Text("Age: \(candidate.age)")
                    Spacer()
                    Slider(value: .convert(from: $candidate.age), in: 45...100, step: 1)
                }
            }
            
            Section {
                HStack {
                    Text("Scandal-bility: \(candidate.scandalous)%")
                    Spacer()
                    Slider(value: .convert(from: $candidate.scandalous), in: 0...100, step: 1)
                }
            }
        }
        .navigationTitle(candidate.name)
    }
}
