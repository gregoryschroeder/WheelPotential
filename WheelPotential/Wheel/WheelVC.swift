//
//  WheelVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/4/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class WheelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var definitionLabel: UILabel!
    var selectedWord: Words?
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        navigationController?.navigationBar.barTintColor = nil
        navigationController?.navigationBar.tintColor = nil
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ActionsVC {
            let vc = segue.destination as? ActionsVC
            vc?.selectedWord = self.selectedWord
        }
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Words.caseCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        
        if let wordText = Words(rawValue: indexPath.row)?.name {
            cell.Word.text = wordText
        }
        
        if let wordColor = Words(rawValue: indexPath.row)?.color {
            cell.Word.textColor = UIColor(hexString: "#\(wordColor)FF")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWord = Words(rawValue: indexPath.row)
        
        if let wordColor = Words(rawValue: indexPath.row)?.color {
            navigationController?.navigationBar.barTintColor = UIColor(hexString: "#\(wordColor)FF")
            nextButton.isEnabled = true
            
            if let filepath = Bundle.main.path(forResource: "\(selectedWord!.name)", ofType: "txt") {
                do {
                    let definition = try String(contentsOfFile: filepath)
                    definitionLabel.text = definition
                } catch {
                    fatalError("Could not read the definition file.")
                }
            } else {
                // TODO: Handle file not found error
                fatalError("Definition file not found.")
            }
        }
    }
}
