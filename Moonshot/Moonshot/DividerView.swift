//
//  DividerView.swift
//  Moonshot
//
//  Created by RATSIMANOSIKA HERY on 29/10/2024.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .padding(.vertical, 5)
            .foregroundStyle(.lightBackground)
    }
}

#Preview {
    DividerView()
}
