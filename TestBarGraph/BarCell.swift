//
//  BarCell.swift
//  TestBarGraph
//
//  Created by Vaishak.Iyer on 23/11/18.
//  Copyright © 2018 Vaishak.Iyer. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    var barHeightConstraint: NSLayoutConstraint?
    var barHighlightColor : UIColor?
    
    lazy var barView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    
    override var isHighlighted: Bool {
        didSet {
            barView.backgroundColor = isHighlighted ? barHighlightColor : .darkGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(barView)
        
        barHeightConstraint = barView.heightAnchor.constraint(equalToConstant: 300)
        barHeightConstraint?.isActive = true
        
        barHeightConstraint?.constant = 100
        
        
        barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
