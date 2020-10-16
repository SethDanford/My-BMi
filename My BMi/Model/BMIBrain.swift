//
//  BMIBrain.swift
//  My BMi
//
//  Created by Danford_Seth on 28/9/20.
//  Copyright © 2020 Seth Danford. All rights reserved.
//

import Foundation

struct BMIBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        bmi = BMI(value: bmiValue)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func convertFtToM(ft: Float) -> Float {
        let m = ft/3.2808
        return m
    }
    func convertMToFt(m: Float) -> Float {
        let ft = m*3.2808
        return ft
    }
    func convertLbsToKg(lbs: Float) -> Float {
        let kg = lbs/2.205
        return kg
    }
    func convertKgToLbs(kg: Float) -> Float {
        let lbs = kg*2.205
        return lbs
    }
}
