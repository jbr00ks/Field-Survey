//
//  FieldSurveyJSONLoader.swift
//  Field Survey
//
//  Created by Joshua Brooks on 11/18/19.
//  Copyright © 2019 Joshua Brooks. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    
    class func load(fileName: String) -> Observations? {
        var observations: Observations?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let path = Bundle.main.url(forResource: fileName, withExtension: ".json"),
            let data = try? Data(contentsOf: path) {
            observations = try? jsonDecoder.decode(Observations.self, from: data)
        }
        return observations
    }
}
