//
//  ResultsVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 12/28/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import CoreData
import UIKit

class ResultsVC: UIViewController {
    
    var selectedWord: Words?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    @IBAction func YesTapped(_ sender: UIButton) {
        let results = Results(context: CoreDataStack.getContext())
        
        results.date = Date()
        results.feeling = Int32((selectedWord?.rawValue)!)
        results.result = true
        
        CoreDataStack.saveContext()
        
        performSegue(withIdentifier: "graphSegue", sender: self)
    }
    
    @IBAction func NoTapped(_ sender: UIButton)  {
        let results = Results(context: CoreDataStack.getContext())
        
        results.date = Date()
        results.feeling = Int32((selectedWord?.rawValue)!)
        results.result = false
        
        CoreDataStack.saveContext()
        
        performSegue(withIdentifier: "graphSegue", sender: self)
    }
}
