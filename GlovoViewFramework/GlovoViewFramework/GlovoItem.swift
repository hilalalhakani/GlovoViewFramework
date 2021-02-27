//
//  GlovoItem.swift
//  GlovoViewFramework
//
//  Created by Hilal  Al Hakkani on 27/02/2021.
//

import Foundation
import UIKit

struct GlovoItem {
    
   var image:UIImage
   var text:String
   var subItems:[GlovoItem]?
   var controller:UIViewController.Type?
    
}
