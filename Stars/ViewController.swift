//
//  ViewController.swift
//  Stars
//
//  Created by Alex Shillingford on 6/11/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    let starController = StarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addStarButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
        let distanceString = distanceTextField.text,
        let distance = Double(distanceString) else {
            return
        }
        
        starController.addStar(named: name, withDistance: distance)
        starController.saveToPersistentStore()
    }
    
    @IBAction func listStarsButtonTapped(_ sender: UIButton) {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        textView.text = output
    }
}

