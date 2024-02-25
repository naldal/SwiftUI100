//
//  MissionView.swift
//  Moonshot
//
//  Created by 송하민 on 2/24/24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaout
    }
    
    var mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .padding(.bottom)
                        
                        Group {
                            if let launchDate = mission.launchDate {
                                Text("Launched Date: \(mission.formattedLaunchDate)")
                            }
                        }
                            
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crew in
                                NavigationLink {
                                    AstronautsView(astronaut: crew.astronaut)
                                } label: {
                                    HStack {
                                        Image(crew.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule().strokeBorder(.white, lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(crew.astronaut.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                            Text(crew.role)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                    }
                                    .padding([.horizontal])
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaout]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaout] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
