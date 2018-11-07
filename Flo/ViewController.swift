//
//  ViewController.swift
//  Flo
//
//  Created by duy on 11/7/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterView: CounterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1;
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1;
            }
        }
        counterLabel.text = String(counterView.counter);
    }
    
}

