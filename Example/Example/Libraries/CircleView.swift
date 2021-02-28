//
//  CircleView.swift
//  Example
//
//  Created by Hilal  Al Hakkani on 28/02/2021.
//

import Foundation
import UIKit

@IBDesignable class Circle: UIView {
    
    @IBInspectable var mainColor: UIColor = UIColor.blue  {
        didSet {
            print("mainColor was set here")
        }
    }
    
       override func draw(_ rect: CGRect) {
        let dotPath = UIBezierPath(ovalIn:rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = dotPath.cgPath
        shapeLayer.fillColor = mainColor.cgColor
        layer.addSublayer(shapeLayer)
    }
    
}
