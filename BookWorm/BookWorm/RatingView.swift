//
//  RatingView.swift
//  Bookworm
//
//  Created by RATSIMANOSIKA HERY on 23/11/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { num in
                Button {
                    rating = num
                } label: {
                    image(for: num)
                        .foregroundColor(num > rating ? offColor : onColor)
                }

            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for num: Int) -> Image {
        if num > rating {
            offImage ?? onImage
        }else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
