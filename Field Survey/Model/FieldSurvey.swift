//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Joshua Brooks on 11/19/19.
//  Copyright © 2019 Joshua Brooks. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct Observation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct Observations: Codable {
    var status: String
    var observations: [Observation]
}

//struct FieldSurvey {
//    let classification: Classification
//    let title: String
//    let description: String
//    let date: Date
//
//    init(classification: Classification, title: String, description: String, date: Date) {
//        self.classification = classification
//        self.title = title
//        self.description = description
//        self.date = date
//    }
//
//    init?(className: String, title: String, description: String, date: Date) {
//        if let classification = Classification(rawValue: className) {
//            self.init(classification: classification, title: title, description: description, date: date)
//        } else {
//            return nil
//        }
//    }
//}
