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
        handicapIndexOutlet.text = handicapCalculator.calculate()
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
    
    @IBAction func addScore(_ sender: UIButton) {
        print("adding a score")
        
        var inputTextField: UITextField?
        var inputTextField1: UITextField?
        
        let alert = UIAlertController(title: "Add a Score", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter Strokes:"
            textField.isSecureTextEntry = false // for password input
            inputTextField = textField
        })
        
        alert.addTextField(configurationHandler: {(textField1: UITextField!) in
            textField1.placeholder = "Enter Course:"
            textField1.isSecureTextEntry = false // for password input
            inputTextField1 = textField1
        })
        
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            let entryStr : String = (inputTextField?.text)!
            
            print("BOOM! I received '\(entryStr)")
        }))
        

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func AddCourse(_ sender: UIButton) {
    }
    
    func saveNewScore(message: String) {
        
    }

}

