//
//  Globals.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/20/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import UIKit
import CoreData

class Globals: NSObject {
    static let sharedInstance = Globals()
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
}
