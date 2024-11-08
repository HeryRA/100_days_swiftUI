//
//  CrewView.swift
//  Moonshot
//
//  Created by RATSIMANOSIKA HERY on 31/10/2024.
//

import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(crew, id: \.role) { crew in
                    NavigationLink(value: crew) {
                        HStack{
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            VStack(alignment: .leading){
                                Text(crew.astronaut.id)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(crew.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(for: CrewMember.self) { member in
                AstronautView(astronaut: member.astronaut)
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let crew = missions[0].crew.map{ member in
        guard let astronaut = astronauts[member.name] else {
            fatalError("Fail to find \(member.name)")
        }
        return CrewMember(role: member.role, astronaut: astronaut)
    }
    CrewView(crew: crew)
        .preferredColorScheme(.dark)
}
