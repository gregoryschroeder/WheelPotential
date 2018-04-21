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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func yesTapped(_ sender: Any) {
        let results = Results(context: CoreDataStack.getContext())
        
        results.date = Date()
        results.feeling = Int32(Words.Love.rawValue)
        results.result = true
        
        CoreDataStack.saveContext()
        
        performSegue(withIdentifier: "GraphSegue", sender: self)
    }
    
    @IBAction func noTapped(_ sender: Any) {
        let results = Results(context: CoreDataStack.getContext())
        
        results.date = Date()
        results.feeling = Int32((selectedWord?.rawValue)!)
        results.result = false
        
        CoreDataStack.saveContext()
        
        performSegue(withIdentifier: "GraphSegue", sender: self)
    }
}
