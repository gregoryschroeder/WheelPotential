//
//  ActionsVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/26/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class ActionsVC: UIViewController {
    
    // MARK: - Properties
    var selectedWord: Words?
    @IBOutlet weak var StepsLabel: UILabel!
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = selectedWord?.name {
            navigationItem.title = word
        }
        
        if let filepath = Bundle.main.path(forResource: "Action - \(selectedWord!.name)", ofType: "txt") {
            do {
                let definition = try String(contentsOfFile: filepath)
                StepsLabel.text = definition
            } catch {
                fatalError("Could not read the definition file.")
            }
        } else {
            // TODO: Handle file not found error
            fatalError("Definition file not found.")
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsVC {
            let vc = segue.destination as? ResultsVC
            vc?.selectedWord = self.selectedWord
        }
    }
    
    @IBAction func nextTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ResultsSegue", sender: self)
    }
}
