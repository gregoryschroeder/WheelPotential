//
//  DefinitionVCViewController.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/21/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class DefinitionVC: UIViewController {
    
    @IBOutlet weak var DefinitionScrollView: UIScrollView!
    @IBOutlet weak var DefinitionLabel: UILabel!
    @IBOutlet weak var WordLabel: UILabel!
    var selectedWord: Words?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = selectedWord?.name {
            
            if let wordColor = selectedWord?.color {
                WordLabel.textColor = UIColor(hexString: "#\(wordColor)FF")
            }
            
            WordLabel.text = word
            
            if let filepath = Bundle.main.path(forResource: "\(word)", ofType: "txt") {
                do {
                    let definition = try String(contentsOfFile: filepath)
                    DefinitionLabel.text = definition
                } catch {
                    // TODO: Handle file read error
                    fatalError("Could not read the file!")
                }
            } else {
                // TODO: Handle file not found error
                fatalError("File not found!")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    @IBAction func BackButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "BackToSelectionSegue", sender: self)
    }
    
    @IBAction func SuggestedActionButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "ActionsSegue", sender: self)
    }
}
