//
//  AnxietyVCViewController.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/26/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class AnxietyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    @IBAction func GoButtonPress() {
        performSegue(withIdentifier: "AnxietySegue", sender: self)
    }
    
}
