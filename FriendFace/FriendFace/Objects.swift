//
//  Objects.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 12/12/2024.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    struct Friend: Hashable, Identifiable, Codable {
        let id: String
        let name: String
    }

    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var formattedRegistered: String {
        registered.formatted(date: .complete, time: .omitted)
    }
    
    static let exampleUser: User = .init(
        id: "5e5e",
        isActive: true,
        name: "Buckner Mccray",
        age: 18,
        company: "SOLARENERGY",
        email: "bucknermccray@solarenergy.com",
        address: "115555555555555555555",
        about: """
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever
            since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five
            centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of
            Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of
            Lorem Ipsum.
            """,
        registered: Date.now,
        tags: ["tag1", "tag2"],
        friends: [
            .init(id: "1", name: "Friend 1"), .init(id: "2", name: "Friend 2"),
        ]
    )
}
