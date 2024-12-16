//
//  ContentView.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [User]()
    
    var body: some View {
        NavigationStack {
            List(people) { person in
                NavigationLink(value: person) {
                    HStack {
                        ActiveSignView(person.isActive)
                        VStack(alignment: .leading) {
                            Text(person.name)
                            Text("from: \(person.company)")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                }
            }
            .navigationTitle("Friends")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard people.isEmpty else { return }
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let (data, _) = try await URLSession.shared.data(from: url)
            let people = try decoder.decode([User].self, from: data)
            self.people = people
        }catch {
            fatalError("Failed to load data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
