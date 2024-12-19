//
//  DetailView.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 12/12/2024.
//

import SwiftUI

struct DetailView: View {
    let user: User
    @State private var showFriends = false
    
    var body: some View {
        Form {
            Section("Contact") {
                VStack(alignment: .leading) {
                    HStack {
                        ActiveSignView(user.isActive)
                        Text(user.isActive ? "(Active)" : "(Inactive)")
                    }
                    .padding(.vertical, 5)
                        
                    Text(". From: \(user.company)")
                    Text(". Email: \(user.email)")
                    Text(". Address: \(user.address)")
                    Text(". Join date: \(user.formattedRegistered)")
                }
            }
            
            Section("About") {
                Text(user.about)
            }
            
            Section {
                Button(showFriends ? "Hide friends" : "Show firends") {
                    withAnimation {
                        showFriends.toggle()
                    }
                }
                if (showFriends) {
                    List(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView(user: User.exampleUser)
//}
