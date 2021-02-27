//
//  GlovoView.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 9/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

public class GlovoView:UIView {
    
    var originalCenter : CGPoint = .zero
    let imageView = UIImageView()
    let label = UILabel()
    var glovoItem:GlovoItem?
    weak var attachementBehavior:UIAttachmentBehavior!
    
    init(frame:CGRect,glovoItem:GlovoItem) {
        
        super.init(frame: frame)
        self.glovoItem = glovoItem
        setupUI(glovoView: glovoItem)
        setupShadow()
    }
    
    
    func setupUI(glovoView:GlovoItem) {
        
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = self.frame.width/2
        self.backgroundColor = .white
        
        self.addSubview(imageView)
        self.addSubview(label)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = glovoItem?.image
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor,constant:20).isActive = true

        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: self.frame.size.height/2)
        heightConstraint.priority = UILayoutPriority(999)
        heightConstraint.isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = glovoItem?.text
        label.font = UIFont.init(name: "Arial", size: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:10).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-10).isActive = true
        label.topAnchor.constraint(equalTo:imageView.bottomAnchor,constant:5).isActive = true
        label.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor,constant: -30).isActive = true
        label.adjustsFontSizeToFitWidth = true
        
    }
    
    func  setupShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height:1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func circularPath() -> UIBezierPath {
        let radius = self.frame.size.width/2
        return UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
    }
    
    public override var collisionBoundsType: UIDynamicItemCollisionBoundsType { return .path }
    
    public override var collisionBoundingPath: UIBezierPath { return circularPath() }
    
    
    
}



 
