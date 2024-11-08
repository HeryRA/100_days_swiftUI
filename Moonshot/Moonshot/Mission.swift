//
//  Mission.swift
//  Moonshot
//
//  Created by RATSIMANOSIKA HERY on 27/10/2024.
//

import Foundation

struct Mission: Identifiable, Codable, Hashable {
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

struct CrewMember: Hashable {
    let role: String
    let astronaut: Astronaut
}
