//
//  addView.swift
//  Habit-tracker
//
//  Created by RATSIMANOSIKA HERY on 15/11/2024.
//

import SwiftUI

struct addView: View {
    let activities: Activities
    @State private var classificationIndex = 0
    @State private var title = ""
    @State private var motivation = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section("Classification") {
                    Picker("Classification", selection: $classificationIndex) {
                        ForEach(activities.classification.indices, id: \.self) { index in
                            Text(activities.classification[index].key)
                        }
                    }
                }
                
                Section("New habit title") {
                    TextField("Title", text: $title)
                    TextField("Motivation", text: $motivation)
                }
            }
            Button{
                let newHabit = Habit(title: title, motivation: motivation)
                activities.classification[classificationIndex].value.append(newHabit)
                dismiss()
            }label: {
                Text("Add")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .navigationTitle("Add habit")
        }
    }
}

#Preview {
    addView(activities: Activities())
}
