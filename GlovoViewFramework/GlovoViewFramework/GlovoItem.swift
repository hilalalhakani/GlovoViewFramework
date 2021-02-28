//
//  GlovoItem.swift
//  GlovoViewFramework
//
//  Created by Hilal  Al Hakkani on 27/02/2021.
//

import Foundation
import UIKit

public struct GlovoItem {
    
    public var image:UIImage
    public var text:String
    public var subItems:[GlovoItem]?
    public var controller:UIViewController.Type?
    
    public init(image: UIImage, text: String, subItems: [GlovoItem]? = nil, controller: UIViewController.Type? = nil) {
        self.image = image
        self.text = text
        self.subItems = subItems
        self.controller = controller
    }
    
}
