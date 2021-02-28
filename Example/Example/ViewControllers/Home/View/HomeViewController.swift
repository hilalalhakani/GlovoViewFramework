//
//  HomeViewController.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 9/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import GlovoViewFramework

class HomeViewController: UIViewController,Storyboarded,UIGestureRecognizerDelegate,HomeViewProtocol {
    
    @IBOutlet weak var wheelView:ALRadialMenu!
    @IBOutlet weak var bottomView:RoundBottomView!
    
    var didAppear = false
    var presenter: HomePresenterProtocol?
    let profileButton = UIButton(type: .custom)

    deinit {
        print("deinit")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if didAppear == false {
            self.wheelView.presentInView()
            self.didAppear = true
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        wheelView.generateButtons(items: items, centerItem: GlovoItem(image:#imageLiteral(resourceName: "CenterLogo"), text: ""))
        wheelView.didPressButton = { [weak self] (glovoView) in
            self?.presenter?.navigateToBubbleDetails(item: glovoView)
        }
        
        bottomView.isUserInteractionEnabled = true
        bottomView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(didPressBottomView)))
    }
 
    func didFetchProfile() {
     }
     
    @objc func openProfile(sender:UIBarButtonItem) {
        presenter?.navigateToProfile()
    }
    
    
    @objc func openNotifications(sender:UIBarButtonItem) {
        presenter?.navigateToNotifications()
    }
    
    @IBAction func didPressBottomView(){
        presenter?.navigateToChat()
    }
    
    
    
    
}





