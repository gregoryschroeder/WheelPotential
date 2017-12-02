//
//  WheelVC.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/4/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit
import AVKit

class WheelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var WheelButton: UIButton!
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
    
    @IBAction func PlayButtonClick(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "WheelPotential_Blu-ray_60_1080i.mpg_1", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
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
            cell.Word.textColor = UIColor(hexString: "#\(wordColor)FF")
//            cell.layer.cornerRadius = 6
//            cell.layer.borderWidth = 2
//            cell.layer.borderColor = UIColor(hexString: "#\(wordColor)FF")?.cgColor
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWord = Words(rawValue: indexPath.row)
        
        if let wordColor = Words(rawValue: indexPath.row)?.color {
            WheelButton.backgroundColor = UIColor(hexString: "#\(wordColor)FF")
            WheelButton.titleLabel?.textColor = UIColor.black
        }
    }
}
