//
//  ContentView.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 12/12/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var availability: Bool? = nil
    @State private var sortOrder = SortDescriptor<User>(\.name)
    @State private var searchText: String = ""
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            UserListView(search: searchText, for: availability, by: sortOrder)
                .navigationTitle("Friends")
                .navigationDestination(for: User.self) { user in
                    DetailView(user: user)
                }
                .toolbar {
                    Menu("Menu", systemImage: "arrow.up.arrow.down") {
                        Menu("filter") {
                            Picker("filter", selection: $availability) {
                                Text("all").tag(nil as Bool?)
                                Text("active").tag(true)
                                Text("inactive").tag(false)
                            }
                        }
                        Menu("sort") {
                            Picker("sort", selection: $sortOrder) {
                                Text("name").tag(SortDescriptor<User>(\.name))
                                Text("company").tag(SortDescriptor<User>(\.company))
                            }
                        }
                    }
                }
                .searchable(text: $searchText)
                .task {
                    await loadData()
                }
        }
    }
    
    func loadData() async {
        do{
            guard try modelContext.fetchCount(FetchDescriptor<User>()) == 0 else { return }
        } catch {
            fatalError("Fail to load data: \(error.localizedDescription)")
        }
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let (data, _) = try await URLSession.shared.data(from: url)
            let people = try decoder.decode([User].self, from: data)
            for person in people {
                modelContext.insert(person)
            }
        }catch {
            fatalError("Failed to load data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
