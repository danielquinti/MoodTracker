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
