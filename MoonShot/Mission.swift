//
//  Mission.swift
//  MoonShot
//
//  Created by New on 5/12/23.
//

import Foundation


struct Mission: Codable, Identifiable{
    var displayName: String{ //nombre de la mision
        "Apollo \(id)"
    }
    var image: String{ //nombre de la imagen
        "apollo\(id)"
    }
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}
