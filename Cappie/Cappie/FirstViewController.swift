//
//  FirstViewController.swift
//  Cappie
//
//  Created by Scott Wallace on 2017-07-29.
//  Copyright © 2017 Scott Wallace. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let handicapCalculator = HandicapCalculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlets
    @IBOutlet weak var handicapIndexOutlet: UILabel!
    
    // Actions
    @IBAction func calculate(_ sender: UIButton) {
        handicapIndexOutlet.text = handicapCalculator.calculate()
    }

}

