//
//  AnxietyVCViewController.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/26/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import AVKit
import UIKit

class AnxietyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    @IBAction func GoButtonPress() {
        performSegue(withIdentifier: "AnxietySegue", sender: self)
    }
    
    @IBAction func VideoButtonClick() {
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
    @IBAction func BackButtonClick(_ sender: Any) {
        
    }
}
