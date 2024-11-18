//
//  ContentView.swift
//  Habit-tracker
//
//  Created by RATSIMANOSIKA HERY on 11/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.classification, id: \.key){ classification in
                    if (classification.value.count > 0){
                        Section(classification.key){
                            ForEach(classification.value, id: \.self){ habit in
                                VStack(alignment: .leading){
                                    Text(habit.title)
                                        .font(.headline)
                                    Text(habit.motivation)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("My Habits Tracker")
            .toolbar{
                Button("Add habit", systemImage: "plus") {
                    showAddActivity = true
                }
            }
            .sheet(isPresented: $showAddActivity){
                addView(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
