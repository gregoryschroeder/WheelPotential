//
//  GraphVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 4/1/18.
//  Copyright © 2018 Schroeder Studios. All rights reserved.
//

import CoreData
import UIKit

class GraphVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var myTableView: UITableView!
    
    let context = CoreDataStack.getContext()
    var results: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadResultsFromCoreData()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    @IBAction func RestartTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let wheelViewController = storyboard.instantiateViewController(withIdentifier: "AnxietyNavigationViewController") as! UINavigationController
        self.present(wheelViewController, animated: true, completion: nil)
    }
    
    // MARK: Private Functions
    
    private func LoadResultsFromCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDescription = NSEntityDescription.entity(forEntityName: "Results", in: context)
        fetchRequest.entity = entityDescription
        
        do {
            results = try context.fetch(fetchRequest) as! [Results]
        } catch {
            fatalError("Could not read results from Core Data")
        }
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) 
        
        if let resultName = results[indexPath.row].feeling as Int32? {
            if let wordText = Words(rawValue: Int(resultName))?.name {
                cell.textLabel?.text = wordText
            } else {
                cell.textLabel?.text = "Invalid word"
            }
        } else {
            cell.textLabel?.text = "No result"
        }
        
//        if let wordText = Words(rawValue: indexPath.row)?.name {
//            cell.Word.text = wordText
//        }
//
//        if let wordColor = Words(rawValue: indexPath.row)?.color {
//            cell.Word.textColor = UIColor(hexString: "#\(wordColor)FF")
//        }
        
        return cell
    }
}
