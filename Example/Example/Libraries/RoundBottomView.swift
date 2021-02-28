//
//  RoundBottomView.swift
//  Example
//
//  Created by Hilal  Al Hakkani on 28/02/2021.
//

import Foundation
import UIKit

@IBDesignable
class RoundBottomView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()

        let y =  CGFloat(80)

        let p2 = CGPoint(x: bounds.size.width, y: y)

        let cp1 = CGPoint(x:bounds.size.width/2, y:-80)
 
        let myBez = UIBezierPath()

        myBez.move(to: CGPoint(x: 0, y: y))
        myBez.addQuadCurve(to: p2, controlPoint: cp1)
 
        myBez.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        myBez.addLine(to: CGPoint(x: 0, y: bounds.size.height))

 
        myBez.close()

        let l = CAShapeLayer()
        l.path = myBez.cgPath
        layer.mask = l

    }

}
