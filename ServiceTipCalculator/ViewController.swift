//
//  ViewController.swift
//  ServiceTipCalculator
//
//  Created by Kelly Ochikubo on 3/9/16.
//  Copyright © 2016 Kelly Ochikubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    @IBOutlet weak var totalPrice: UITextField!
    @IBOutlet var serviceQuality: UIPickerView!
    
    var qualityPicker : [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        qualityPicker = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateServiceTip(sender: AnyObject) {
        
    }
    
    
    
}

