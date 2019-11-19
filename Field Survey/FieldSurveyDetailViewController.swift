//
//  FieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Joshua Brooks on 11/18/19.
//  Copyright © 2019 Joshua Brooks. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    
    @IBOutlet weak var classificationIconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dateFormatter = DateFormatter()
    
    var fieldSurvey: Observation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let fieldSurvey = fieldSurvey {
            titleLabel.text = fieldSurvey.title
            descriptionLabel.text = fieldSurvey.description
            dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            classificationIconImage.image = UIImage(named: fieldSurvey.classification.rawValue + "Icon")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
