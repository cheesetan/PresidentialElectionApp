//
//  Candidate+Samples.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import Foundation

extension Candidate {
    static var candidateSamples = [
        Candidate(name: "Dharman ", age: 60, scandalous: 0.7, privateSector: false, isEligible: true),
        Candidate(name: "Ng Sing Song", age: 70, scandalous: 0.7, privateSector: true, isEligible: true),
        Candidate(name: "Gregory Stop", age: 55, scandalous: 0.7, privateSector: true, isEligible: false),
        Candidate(name: "King Ah Lian", age: 87, scandalous: 0.7, privateSector: true, isEligible: true)
    ]
}
