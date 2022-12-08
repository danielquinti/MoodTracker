//
//  MoodModel.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 08/12/2022.
//

import Foundation

struct MoodModel: Decodable {
    var feelings: [FirstLevelFeeling]
}

struct FirstLevelFeeling: Decodable {
    var name : String
    var details: [SecondLevelFeeling]
}


struct SecondLevelFeeling: Decodable {
    var name : String
    var details: [ThirdLevelFeeling]
}

struct ThirdLevelFeeling: Decodable {
    var name : String
    var details: [String]
}

func loadJson() -> [MoodModel]? {
    if let url = Bundle.main.url(forResource: "feelings", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(MoodModel.self, from: data)
            print(jsonData)
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
