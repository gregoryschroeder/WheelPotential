//
//  ActionsVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/26/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import Foundation
import UIKit

class ActionsVC: UIViewController {
    
    var selectedWord: Words?
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsVC {
            let vc = segue.destination as? ResultsVC
            vc?.selectedWord = self.selectedWord
        }
    }
    
    @IBAction func GoTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ResultsSegue", sender: self)
    }
}
