//
//  ActiveSignView.swift
//  FriendFace
//
//  Created by RATSIMANOSIKA HERY on 16/12/2024.
//

import SwiftUI

struct ActiveSignView: View {
    var isActive: Bool
    
    var body: some View {
        Image(systemName: "circle.fill")
            .foregroundStyle(isActive ? .green : .gray)
            .overlay {
                Circle()
                    .stroke(lineWidth: 1)
            }
            .shadow(color: .gray, radius: 4, x: 0, y: 0)
            .padding(.horizontal, 5)
    }
    
    init(_ isActive: Bool) {
        self.isActive = isActive
    }
}

#Preview {
    ActiveSignView(true)
}
