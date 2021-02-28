//
//  GlovoItems.swift
//  Example
//
//  Created by Hilal  Al Hakkani on 28/02/2021.
//

import Foundation
import GlovoViewFramework

let items = [
    
    GlovoItem.init(image: #imageLiteral(resourceName: "Subjects"), text: "Subjects",controller:nil),
    
    GlovoItem.init(image: #imageLiteral(resourceName: "MySchool"), text: "School",
                   subItems:[GlovoItem(image: #imageLiteral(resourceName: "Library"), text: "Library",controller: nil)]),
    
    
    GlovoItem.init(image: #imageLiteral(resourceName: "News"), text: "News",controller: NewsViewController.self),
 
    
    GlovoItem.init(image: #imageLiteral(resourceName: "dashBoard"), text: "Fees",controller: FeesViewController.self) ,
    
 
    
    GlovoItem.init(image: #imageLiteral(resourceName: "Calendar"), text: "Schedule",subItems:
                    [GlovoItem.init(image: #imageLiteral(resourceName: "Agenda"), text: "Agenda",controller: MonthlyEventsViewController.self),
                     GlovoItem.init(image: #imageLiteral(resourceName: "Calendar"), text: "Calendar",controller:MonthlyEventsViewController.self),
                     GlovoItem.init(image: #imageLiteral(resourceName: "Calendar"), text: "Class Schedule",controller: ClassScheduleViewController.self)])
]