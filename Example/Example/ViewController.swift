//
//  HomeViewController.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 9/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import GlovoViewFramework

class HomeViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var wheelView:ALRadialMenu!
    @IBOutlet weak var bottomView:MyRoundBottomView!
    
    var didAppear = false

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
        setupNavigationBar()
        
        wheelView.generateButtons(items: items, centerItem: GlovoItem(image:#imageLiteral(resourceName: "CenterLogo"), text: "Anything"))
        wheelView.didPressButton = { [weak self] (glovoView) in
            self?.presenter?.navigateToBubbleDetails(item: glovoView)
        }
        
        bottomView.isUserInteractionEnabled = true
        bottomView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(didPressBottomView)))
    }
    
    

    
    func setupNavigationBar(){
        //Transparent navigation Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    
        let profileButton = UIButton(type: .custom)
        profileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        profileButton.addTarget(self, action: #selector(openProfile(sender:)), for: .touchUpInside)

       
         self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
        
        
        
        
        let rightBarButtonItem = UIBarButtonItem.init(image:#imageLiteral(resourceName: "notifications"), style: .done, target: self, action: #selector(openNotifications))
        rightBarButtonItem.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
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





