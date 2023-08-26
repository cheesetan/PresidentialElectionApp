//
//  NewCandidateView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI

struct NewCandidateView: View {
    
    @State var name = String()
    @State var age = Int()
    @State var scandal = Int()
    
    @ObservedObject var candidatesManager: CandidateManager = .shared
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Candidate's name", text: $name)
                HStack {
                    Text("Age: \(age)")
                    Spacer()
                    Slider(value: .convert(from: $age), in: 45...100, step: 1)
                }
            }
            
            Section {
                HStack {
                    Text("Scandal-bility: \(scandal)%")
                    Spacer()
                    Slider(value: .convert(from: $scandal), in: 0...100, step: 1)
                }
            }
            
            Section {
                Button {
                    candidatesManager.candidates.append(Candidate(name: name, age: age, scandalous: scandal))
                    dismiss.callAsFunction()
                } label: {
                    Text("Create Candidate")
                }
                .disabled(name.isEmpty)
            }
        }
        .navigationTitle("Candidate Creator")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NewCandidateView()
}
