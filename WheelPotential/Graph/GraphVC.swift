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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        
        cell.ResultGraph.color = UIColor.clear
        cell.ResultGraph.fill = 0
        
        if let emotionName = results[indexPath.row].feeling as Int32? {
            if let wordText = Words(rawValue: Int(emotionName))?.name {
                cell.EmotionLabel.text = wordText
                if let wordColor = Words(rawValue: Int(emotionName))?.color {
                    cell.ResultGraph.color = UIColor(hexString: "#\(wordColor)FF")!
                    cell.ResultGraph.fill = Int(emotionName)
                }
            } else {
                cell.EmotionLabel.text = "Invalid word"
            }
        } else {
            cell.EmotionLabel.text = "No result"
        }
        
        if let responseDate = results[indexPath.row].date as Date? {
            let dateString = responseDate.toString(dateFormat: "MMM/dd/yyyy")
            cell.DateLabel.text = dateString
        }
        
        if let responseName = results[indexPath.row].result as Bool? {
            if responseName == true {
                cell.ResponseLabel.text = "I got what I wanted"
            } else {
                cell.ResponseLabel.text = "I did not get what I wanted"
            }
        }
        
//        if let emotionName = results[indexPath.row].feeling as Int32? {
//            if let wordColor = Words(rawValue: Int(emotionName))?.color {
//                cell.DateLabel.textColor = UIColor(hexString: "#\(wordColor)FF")
//                cell.EmotionLabel.textColor = UIColor(hexString: "#\(wordColor)FF")
//                cell.ResponseLabel.textColor = UIColor(hexString: "#\(wordColor)FF")
//            }
//        }
        
        return cell
    }
}
