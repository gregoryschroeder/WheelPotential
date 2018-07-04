//
//  ResultGraphControl.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 7/4/18.
//  Copyright © 2018 Schroeder Studios. All rights reserved.
//

import UIKit

@IBDesignable class ResultGraphControl: UIStackView {

    // MARK: Properties
    private var fullGraph = [UIView]()
    private var fill = 0
    
    @IBInspectable var size: CGSize = CGSize(width: 17.0, height: 17.0) {
        didSet {
            setupGraph()
        }
    }
    @IBInspectable var count: Int = 20 {
        didSet {
            setupGraph()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGraph()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupGraph()
    }
    
    // MARK: Private Methods
    private func setupGraph() {
        
        for view in fullGraph {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        fullGraph.removeAll()
        
        for _ in 0..<count {
            // Create the view
            let view = UIView()
            
            // Set background color
            view.backgroundColor = UIColor.red
            
            // Add constraints
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            view.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            
            // Add the view to the stack
            addArrangedSubview(view)
            
            // Add the view to the fullGraph array
            fullGraph.append(view)
        }
    }
}
