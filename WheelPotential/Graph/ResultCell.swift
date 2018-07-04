//
//  ResultCell.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 4/26/18.
//  Copyright © 2018 Schroeder Studios. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var EmotionLabel: UILabel!
    @IBOutlet weak var ResponseLabel: UILabel!
    @IBOutlet weak var ResultGraph: ResultGraphControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
}
