//
//  WheelVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/4/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit

class WheelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var selectedWord: Words?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    
    @IBAction func WheelButtonClick() {
        if let _ = selectedWord {
            performSegue(withIdentifier: "WheelDefinitionSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DefinitionVC {
            let vc = segue.destination as? DefinitionVC
            vc?.selectedWord = self.selectedWord
        }
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Words.caseCount
//        return 22
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell

        if let wordText = Words(rawValue: indexPath.row)?.name {
            cell.Word.text = wordText
        }
        
        if let wordColor = Words(rawValue: indexPath.row)?.color {
            cell.backgroundColor = UIColor(hexString: "#\(wordColor)FF")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWord = Words(rawValue: indexPath.row)
    }
}
