//
//  ContentView.swift
//  Bookworm
//
//  Created by RATSIMANOSIKA HERY on 22/11/2024.
//

import SwiftData
import SwiftUI

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students){ student in
                VStack(alignment: .leading){
                    Text(student.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Students")
            .toolbar {
                Button("Add") {
                    let student = Student(id: UUID(), name: "RATSIMANOSIKA HERY")
                    modelContext.insert(student)
                    do{
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
