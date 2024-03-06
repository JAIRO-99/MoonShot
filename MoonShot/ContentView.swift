//
//  ContentView.swift
//  MoonShot
//
//  Created by New on 12/23.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    let astronauts:[String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .padding()
                                    .scaledToFit()
                                    .frame(width: 150,height: 150)
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray.opacity(0.5))
                                }
                               .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                .frame(maxWidth: .infinity)
                            }
                            
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                           .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShoot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
