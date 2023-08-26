//
//  CandidateManager.swift
//  PresidentialElectionApp
//
//  Created by Tristan Chay on 26/8/23.
//

import Foundation

struct Candidate: Identifiable, Codable {
    var id = UUID()
    var name: String
    var age: Int
    var scandalous: Double
    var privateSector: Bool
    var isEligible: Bool
}

class CandidateManager: ObservableObject {
    static let shared: CandidateManager = .init()
    
    @Published var candidates: [Candidate] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "candidates.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedCandidates = try? propertyListEncoder.encode(candidates)
        try? encodedCandidates?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedCandidateData = try? Data(contentsOf: archiveURL),
            let candidatesDecoded = try? propertyListDecoder.decode([Candidate].self, from: retrievedCandidateData) {
            candidates = candidatesDecoded
        }
    }
}

