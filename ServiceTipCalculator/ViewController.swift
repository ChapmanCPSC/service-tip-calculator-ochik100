//
//  ViewController.swift
//  ServiceTipCalculator
//
//  Created by Kelly Ochikubo on 3/9/16.
//  Copyright © 2016 Kelly Ochikubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
    @IBOutlet weak var totalPrice: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var servicePicker: UIPickerView!
    
    let qualityPicker = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var picked : String? = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPrice.textAlignment = .Center
        
        self.servicePicker.delegate = self
        self.servicePicker.dataSource = self
        self.servicePicker.showsSelectionIndicator = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateServiceTip(sender: AnyObject) {
        
        var tipPercentage : Double
        var price : Double?
        
        switch(picked!)
        {
        case "1", "2", "3":
            tipPercentage = 0.10
        case "4", "5":
            tipPercentage = 0.13
        case "6", "7":
            tipPercentage = 0.15
        case "8", "9":
            tipPercentage = 0.20
        case "10":
            tipPercentage = 0.25
        default:
            tipPercentage = 0.15
        }
        
        if ((totalPrice.text?.isEmpty) != nil)
        {
            price = Double(totalPrice.text!)
        }
        
        if price != nil
        {
            let tip = price! * tipPercentage
            tipLabel.text = String(tip.roundTo(numberOfDecimals: 2))
        }
        else
        {
            tipLabel.text = "Invalid input"
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picked = qualityPicker[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return qualityPicker[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return qualityPicker.count
    }
    
    
}

extension Double
{
    func roundTo(numberOfDecimals n : Int) -> Double
    {
        let divisor = pow(10.0, Double(n))
        return round(self * divisor) / divisor
    }
}

