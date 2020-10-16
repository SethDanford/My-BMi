//
//  FirstViewController.swift
//  My BMi
//
//  Created by Danford_Seth on 28/9/20.
//  Copyright © 2020 Seth Danford. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var bmiBrain = BMIBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var mathSystem: UISegmentedControl!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        if mathSystem.selectedSegmentIndex == 0 {
            heightLabel.text = String(format: "%.2fm", heightSlider.value)
        } else {
            heightLabel.text = String(format: "%.1fft", heightSlider.value)
        }
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        if mathSystem.selectedSegmentIndex == 0 {
            weightLabel.text = String(format: "%.0fkg", weightSlider.value)
        } else {
            weightLabel.text = String(format: "%.0flbs", weightSlider.value)
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        var weightValue: Float
        var heightValue: Float
        
        if mathSystem.selectedSegmentIndex == 1 {
            weightValue = bmiBrain.convertLbsToKg(lbs: weightSlider.value)
            heightValue = bmiBrain.convertFtToM(ft: heightSlider.value)
        } else {
            weightValue = weightSlider.value
            heightValue = heightSlider.value
        }
        bmiBrain.calculateBMI(height: heightValue, weight: weightValue)
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    @IBAction func mathSystemChanged(_ sender: UISegmentedControl) {
        if mathSystem.selectedSegmentIndex == 0 {
            heightSlider.minimumValue = 1
            heightSlider.maximumValue = 3
            // print(bmiBrain.convertFtToM(ft: heightSlider.value))
            heightSlider.value = 2
            heightLabel.text = String(format: "%.2fm", heightSlider.value)
            weightSlider.minimumValue = 25
            weightSlider.maximumValue = 200
            weightSlider.value = 112.5
            // weightSlider.value = bmiBrain.convertLbsToKg(lbs: weightSlider.value)
            weightLabel.text = String(format: "%.0fkg", weightSlider.value)
        } else {
            heightSlider.minimumValue =  3
            heightSlider.maximumValue = 10
            heightSlider.value = 6.5
            // heightSlider.value = bmiBrain.convertMToFt(m: heightSlider.value)
            heightLabel.text = String(format: "%.1fft", heightSlider.value)
            weightSlider.minimumValue = 55
            weightSlider.maximumValue = 440
            weightSlider.value = 247.5
            // weightSlider.value = bmiBrain.convertKgToLbs(kg: weightSlider.value)
            weightLabel.text = String(format: "%.0flbs", weightSlider.value)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showResults" {
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.bmiValue = bmiBrain.getBMIValue()
        }
    }
}

