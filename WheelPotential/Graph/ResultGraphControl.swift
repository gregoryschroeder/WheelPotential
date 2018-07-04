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
    private let size = CGFloat(22.0)
    private var fullGraph = [UIView]()
    private var fill = 0
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGraph(segments: 20)
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // MARK: Private Methods
    private func setupGraph(segments: Int) {
        
        for view in fullGraph {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        fullGraph.removeAll()
        
        for _ in 0..<segments {
            // Create the view
            let view = UIView()
            view.backgroundColor = UIColor.red
            
            // Add constraints
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: size).isActive = true
            view.widthAnchor.constraint(equalToConstant: size).isActive = true
            
            // Add the view to the stack
            addArrangedSubview(view)
            
            // Add the view to the fullGraph array
            fullGraph.append(view)
        }
    }
}
