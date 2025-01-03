//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 12/12/2024.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
