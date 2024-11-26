//
//  BookwormApp.swift
//  Bookworm
//
//  Created by RATSIMANOSIKA HERY on 22/11/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
