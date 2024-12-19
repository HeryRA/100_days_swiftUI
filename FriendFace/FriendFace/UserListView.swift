//
//  UserListView.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 18/12/2024.
//

import SwiftData
import SwiftUI

struct UserListView: View {
    @Query var people: [User]
    
    var body: some View {
        List(people) { user in
            NavigationLink(value: user) {
                HStack {
                    ActiveSignView(user.isActive)
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text("from: \(user.company)")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.8))
                    }
                }
            }
        }
    }
    
    init(search searchText: String, for filter: Bool?, by sortOrder: SortDescriptor<User>) {
        if searchText.isEmpty {
            if let filter = filter {
                _people = Query(filter: #Predicate<User>{ user in
                    user.isActive == filter
                }, sort: [sortOrder])
            }else {
                _people = Query(sort: [sortOrder])
            }
        } else {
            _people = Query(filter: #Predicate<User>{ user in
                user.name.localizedStandardContains(searchText)
            }, sort: [sortOrder])
        }
    }
}

//#Preview {
//    UserListView()
//}
