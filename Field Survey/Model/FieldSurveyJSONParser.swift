////
////  FieldSurveyJSONParser.swift
////  Field Survey
////
////  Created by Joshua Brooks on 11/18/19.
////  Copyright © 2019 Joshua Brooks. All rights reserved.
////
//
//import Foundation
//
//class FieldSurveyJSONParser {
//    
//    static let dateFormatter = DateFormatter()
//    
//    class func parse(_ data: Data) -> [FieldSurvey] {
//        var fieldSurvey = [FieldSurvey]()
//        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
//        
//        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
//        let root = json as? [String: Any],
//        let status = root["status"] as? String,
//        status == "ok" {
//        
//            if let observations = root["observations"] as? [Any] {
//                for observation in observations {
//                    if let observation = observation as? [String: String] {
//                        if let className = observation["classification"],
//                            let title = observation["title"],
//                            let description = observation["description"],
//                            let dateString = observation["date"],
//                            let date = dateFormatter.date(from: dateString) {
//                                if let observationSurvey = FieldSurvey(className: className, title: title, description: description, date: date) {
//                                    fieldSurvey.append(observationSurvey)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        
//        return fieldSurvey
//    }
//}
