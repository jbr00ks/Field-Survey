//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Joshua Brooks on 11/18/19.
//  Copyright © 2019 Joshua Brooks. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let fileName = "field_observations"
    
    var fieldSurvey: Observations?
    
//    let fieldSurvey = FieldSurveyJSONLoader.load(fileName: "field_observations")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        fieldSurvey = FieldSurveyJSONLoader.load(fileName: fileName)
        
        if fieldSurvey == nil {
//            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurvey?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveyTableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let observation = fieldSurvey?.observations[indexPath.row] {
            cell.titleLabel.text = observation.title
            cell.dateLabel.text = dateFormatter.string(from: observation.date)
            cell.classificationIconImageView.image = UIImage(named: observation.classification.rawValue + "Icon")
            }
            return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let selectedIndexPath = fieldSurveyTableView.indexPathForSelectedRow {
            destination.fieldSurvey = fieldSurvey?.observations[selectedIndexPath.row]
        }
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
