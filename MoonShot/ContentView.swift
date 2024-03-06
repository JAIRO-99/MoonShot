//
//  ContentView.swift
//  MoonShot
//
//  Created by New on 4/12/23.
//
/*
 Image("pexel")
 .resizable()
 .scaledToFill()
 .frame(width: 300,height: 300)
 */
/*
 ScrollView(.horizontal){
     LazyHStack(spacing: 10) {
        
         ForEach(0..<100){
             CustomText("Item \($0)")
                 .font(.title)
         }
     }
 }
 */
/*
NavigationStack{
    NavigationLink{
        Text("Detail view")
    }label: {
        VStack{
            Text("This is the label")
            Text("So is this")
            Image(systemName: "face.smiling")
        }
        .font(.title)
    }
    .navigationTitle("SwiftUI")
}
*/
/*
NavigationStack{
    List(0..<100){ row in
        NavigationLink("Row \(row)"){
            Text("Detail \(row)")
        }
    }
    .navigationTitle("SwiftUI")
}
*/
import SwiftUI


/*
struct User: Codable {
    let name: String
    let address: Address
}
struct Address: Codable {
    let street: String
    let city: String
}
*/
/*
Button("Decode JSON"){
    let input = """
{
"name": "Taylor Swift",
"address": {
    "street": "555, Taylor Swift Avenue",
    "city": "Nashville"
}
}
"""
    let data = Data(input.utf8)
    let decoder = JSONDecoder()
    if let user = try? decoder.decode(User.self, from: data){
        print(user.address.city)
    }
}
*/ // decodificar JSON
/*
let layout = [
    GridItem(.adaptive(minimum: 80, maximum: 120))
]
*/ //lazyvgrid
/*
ScrollView(.horizontal){
    LazyHGrid(rows: layout){
        ForEach(0..<1000){
            Text("Item \($0)")
        }
    }
}
*/ //body lazygrid
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
