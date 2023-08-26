//
//  CandidatesView.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import SwiftUI

struct CandidatesView: View {
    
    enum Roles: String, CaseIterable {
        case singaporean = "Singaporean"
        case electionsDepartment = "Elections Department"
    }
    
    @State var showCreation = false
    @State var currentRole: Roles = .singaporean
    @ObservedObject var candidateManager: CandidateManager = .shared
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        Picker(selection: $currentRole) {
                            ForEach(Roles.allCases, id: \.self) { role in
                                Text(role.rawValue)
                                    .tag(role)
                            }
                        } label: {
                            Text("Your role in society")
                        }
                        .pickerStyle(.menu)
                    }
                    ForEach($candidateManager.candidates, id: \.id) { $candidate in
                        NavigationLink {
                            CandidatesDetailView(candidate: $candidate)
                        } label: {
                            candidateListItem($candidate)
                        }
                    }
                    .onDelete { indexSet in
                        candidateManager.candidates.remove(atOffsets: indexSet)
                    }
                }
                
            }
            .sheet(isPresented: $showCreation) {
                NewCandidateView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if currentRole == .electionsDepartment { EditButton()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if currentRole == .electionsDepartment {
                        Button {
                            showCreation.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .onAppear {
           loadCandidates()
        }
    }
    
    @ViewBuilder
    func candidateListItem(_ candidate: Binding<Candidate>) -> some View {
        VStack(alignment: .leading) {
            Text(candidate.name.wrappedValue)
                .font(.title3)
                .fontWeight(.semibold)
            Text("Age: \(candidate.age.wrappedValue)")
                .font(.footnote)
            Text("Scandal-ability: \(candidate.scandalous.wrappedValue)%")
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
    ContentView()
}
