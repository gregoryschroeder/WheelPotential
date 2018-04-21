//
//  GraphVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 4/1/18.
//  Copyright © 2018 Schroeder Studios. All rights reserved.
//

import UIKit

class GraphVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation
    
    @IBAction func RestartTapped(_ sender: Any) {
        performSegue(withIdentifier: "RestartSegue", sender: self)
    }


}
