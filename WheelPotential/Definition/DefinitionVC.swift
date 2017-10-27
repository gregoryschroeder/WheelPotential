//
//  DefinitionVCViewController.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/21/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class DefinitionVC: UIViewController {

    @IBOutlet weak var DefinitionLabel: UILabel!
    var selectedWord: Words?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let word = selectedWord?.name {
            DefinitionLabel.text = "\(word)\n\nThe definition of the chosen word will go on this screen."
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    @IBAction func SuggestedActionButtonPress(_ sender: Any) {
            performSegue(withIdentifier: "ActionsSegue", sender: self)
    }
}
