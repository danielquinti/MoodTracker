//
//  MoodModelManager.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 15/12/2022.
//

import Foundation

struct MoodModelManager{
    
    func loadJson() -> MoodModel? {
        if let url = Bundle.main.url(forResource: "feelings", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoodModel.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    var model : MoodModel?{
        return loadJson()
    }
    
    private func getFirstLevelFeeling(comfort:Bool)->FirstLevelFeeling?{
        let keyword = comfort ? "comfortable" :  "uncomfortable"
        if let safeModel = model {
            for category in safeModel.feelings{
                if category.name==keyword{
                    return category
                }
            }
        }
        return nil
    }
    func getSecondLevelFeelings(comfort:Bool)->[SecondLevelFeeling]?{
        if let safeFirstLevelFeeling = getFirstLevelFeeling(comfort: comfort){
            var returnValue : [SecondLevelFeeling] = []
            for element in safeFirstLevelFeeling.details{
                returnValue.append(element)
            }
            return returnValue
        }
        return nil
    }
    

    
}
