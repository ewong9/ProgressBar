//
//  ViewController.swift
//  ProgressBar
//
//  Created by Elliot on 3/28/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!

    // initial stepper count
    var sum = 0
    // maximum total allowed
    var max = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // stepper maximum value allowed
        stepper.maximumValue = 5
        stepper2.maximumValue = 5
        stepper3.maximumValue = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // action when stepper is pressed
    @IBAction func stepperValue(sender: UIStepper) {
        changeCount()
    }
    
    // action when stepper2 is pressed
    @IBAction func stepper2Value(sender: UIStepper) {
        changeCount()
    }
    
    // action when stepper3 is pressed
    @IBAction func stepper3Value(sender: UIStepper) {
        changeCount()
    }
    
    // calculate count of steppers and display progress bar
    func changeCount() {
        // calculate sum of stepper values
        let sum = Int(stepper.value + stepper2.value + stepper3.value)
        // calculate ratio
        let ratio = Float(sum) / Float(max)
        // display progress bar based on ratio
        progressBar.progress = Float(ratio)
        // display label
        progressLabel.text = "\(sum) out of \(max)"
        
        // if sum is less than 3
        if (sum < 3) {
            // change progress bar color to blue
            progressBar.progressTintColor = UIColor.blueColor()
            
        // if sum is equal to 3
        } else if (sum == 3) {
            // change progress bar color to green
            progressBar.progressTintColor = UIColor.greenColor()
            
            // show alert
            let alert = UIAlertController(title: "Good job!", message: "You ate enough fruit today!", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
            
        // if sum is greater than 3
        } else if (sum > 3) {
            // change progress bar color to red
            progressBar.progressTintColor = UIColor.redColor()
            
            // show alert
            let alert = UIAlertController(title: "Oh no...", message: "You ate too much fruit today!", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
    }
    
}

