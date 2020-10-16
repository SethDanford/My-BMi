//
//  SecondViewController.swift
//  My BMi
//
//  Created by Danford_Seth on 28/9/20.
//  Copyright © 2020 Seth Danford. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue: String?

    @IBOutlet weak var bmiResult: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResult.text = bmiValue
    }
    
}
