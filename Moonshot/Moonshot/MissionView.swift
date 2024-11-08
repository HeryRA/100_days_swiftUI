//
//  MissionView.swift
//  Moonshot
//
//  Created by RATSIMANOSIKA HERY on 28/10/2024.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack{
                Image(mission.imageName)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axe in
                        width * 0.6
                    }
                    .padding(.top)
                VStack(alignment: .leading){
                    Text("Launch date: \(mission.formattedLaunchDate)")
                        .padding(.top)
                    DividerView()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    DividerView()
                }
                .padding(.horizontal)
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map{ member in
            guard let astronaut = astronauts[member.name] else {
                fatalError("Unable to find \(member.name)")
            }
            return CrewMember(role: member.role, astronaut: astronaut)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
