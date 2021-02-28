//
//  RadialMenu.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 9/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

public class ALRadialMenu: UIView {
    
    private var delay: Double = 0.2
    private var radius: Double!
    private var startAngle: Angle = Angle(degrees:90)
    private var circumference: Angle = Angle(degrees: 360)
    private var spacingDegrees: Angle!
    private var animationOrigin: CGPoint!
    
    // Needs calculation
    private let bubbleSize = 110
    
    public var didPressButton:((_ center:GlovoView)->Void)?
    private var centerButton:GlovoView?
    
    private var glovoViews = [GlovoView](){
        didSet {
            calculateSpacing()
        }
    }
    
    private lazy var dynamicAnimator: UIDynamicAnimator =
        {
            let dynamicAnimator = UIDynamicAnimator(referenceView: self)
            return dynamicAnimator
        }()
    
    private lazy var collision: UICollisionBehavior =
        {
            var dynamicItems = [UIDynamicItem]()
            dynamicItems.append(contentsOf: self.glovoViews)
            if centerButton != nil {
                dynamicItems.append(centerButton!)
            }
            let collision = UICollisionBehavior(items:dynamicItems)
            collision.translatesReferenceBoundsIntoBoundary = false
            return collision
        }()
    
    private lazy var attachementBehaviors: [UIAttachmentBehavior] =
        {
            var attachementBehaviors = [UIAttachmentBehavior]()
            var dynamicItems = [GlovoView]()
            dynamicItems.append(contentsOf: self.glovoViews)
            if centerButton != nil {
                dynamicItems.append(self.centerButton!)
            }
            for button in  dynamicItems
            {
                let attachement = UIAttachmentBehavior.init(item: button, attachedToAnchor: button.originalCenter)
                button.attachementBehavior = attachement
                attachement.damping = 0.5
                attachement.frequency = 2
                attachementBehaviors.append(attachement)
            }
            return attachementBehaviors
        }()
    
    private lazy var itemBehavior: UIDynamicItemBehavior =
        {
            var dynamicItems = [UIDynamicItem]()
            dynamicItems.append(contentsOf: self.glovoViews)
            if centerButton != nil {
                dynamicItems.append(centerButton!)
            }
            let itemBehavior = UIDynamicItemBehavior(items:dynamicItems)
            itemBehavior.allowsRotation = false
            itemBehavior.angularResistance = 0.1
            itemBehavior.density = 1
            itemBehavior.elasticity = 0.2
            itemBehavior.friction = 0.2
            itemBehavior.resistance = 8
            return itemBehavior
        }()
    
    private lazy var panGesture: UIPanGestureRecognizer =
        {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(sender:)))
            return panGesture
        }()
    
    private var attachment :UIAttachmentBehavior!
    
    
    
    @objc func handlePan(sender: UIPanGestureRecognizer)
    {
        let location = sender.location(in: self)
        
        switch sender.state
        {
        case .began:
            attachment = UIAttachmentBehavior(item:sender.view!, attachedToAnchor: .zero)
            attachment.anchorPoint = location
            dynamicAnimator.addBehavior(attachment)
            dynamicAnimator.removeBehavior(collision)
            
        case .changed:
            attachment.anchorPoint = location
            
        default:
            dynamicAnimator.addBehavior(collision)
            dynamicAnimator.removeBehavior(attachment)
            break
        }
    }
    
  
    
    public func generateButtons(items:[GlovoItem],centerItem:GlovoItem?){
        self.radius = Double(self.frame.width/2) - 20
        if centerItem != nil {
            centerButton = GlovoView(frame: CGRect(x: 0, y:0, width: bubbleSize + 20, height: bubbleSize + 20),glovoItem:centerItem!)
        }
        for item in items{
            let glovoView = GlovoView(frame: CGRect(x: 0, y: 0, width: bubbleSize, height: bubbleSize),glovoItem: item)
            glovoViews.append(glovoView)
            glovoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapView)))
            
        }
        self.glovoViews.forEach({$0.originalCenter = $0.center})
    }
    
    
    @objc public func didTapView(sender:UITapGestureRecognizer){
        didPressButton?(sender.view as! GlovoView)
    }
    
    
    public func presentInView() {
        
        if glovoViews.count == 0 {
            print("ALRadialMenu has no buttons to present")
        }
        if animationOrigin == nil {
            animationOrigin = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/2)
            // animationOrigin = center not working
        }
        if centerButton != nil {
            self.addSubview(centerButton!)
            centerButton?.center = self.animationOrigin
            centerButton?.originalCenter = self.animationOrigin
        }
        
        for i in 0..<glovoViews.count {
            
            let button = glovoViews[i]
            self.addSubview(button)
            presentAnimation(view: button, index: i)
        }
        
        for attachement in self.attachementBehaviors
        {
            self.dynamicAnimator.addBehavior(attachement)
        }
        dynamicAnimator.addBehavior(itemBehavior)
        self.glovoViews.forEach({$0.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)) ) ) } )
        if centerButton != nil {
            self.centerButton!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:))))
        }
        
    }
    
    
    private var animationOptions: UIView.AnimationOptions = [.curveEaseInOut, .beginFromCurrentState]
    
    private func presentAnimation(view: GlovoView, index: Int) {
        let degrees = startAngle.degrees + spacingDegrees.degrees * Double(index)
        let newCenter = pointOnCircumference(origin: animationOrigin, radius: radius, angle: Angle(degrees: degrees))
        let _delay = Double(index) * delay
        view.center = animationOrigin
        view.originalCenter = newCenter
        view.alpha = 0
        view.center = newCenter
        view.transform = CGAffineTransform.init(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 0.7, delay: _delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: animationOptions, animations: {
            view.alpha = 1
            view.transform = .identity
        }, completion: nil)
    }
    
    private func pointOnCircumference(origin: CGPoint, radius: Double, angle: Angle) -> CGPoint {
        
        let radians = angle.radians()
        let x = origin.x + CGFloat(radius) * CGFloat(cos(radians))
        let y = origin.y + CGFloat(radius) * CGFloat(sin(radians))
        
        return CGPoint(x: x, y: y)
    }
    
    private func calculateSpacing() {
        if glovoViews.count > 0 {
            
            var c = glovoViews.count
            
            if circumference.degrees < 360 && c > 1 {
                c -= 1
            }
            
            spacingDegrees = Angle(degrees: circumference.degrees / Double(c))
        }
    }
}


private struct Angle {
    var degrees: Double
    
    func radians() -> Double {
        return degrees * (Double.pi / 180)
    }
}

