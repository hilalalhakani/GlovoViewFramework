//
//  BubbleDetailsViewController.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 9/16/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import GlovoViewFramework

class BubbleDetailsViewController: UIViewController,Storyboarded,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var wheelView:ALRadialMenu!
    @IBOutlet weak var selectedItemLabel:UILabel!
    
    var items = [GlovoItem]()
    var didShow = false
    var selectedLabel:String!
    deinit {
        print("deinit")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if didShow == false {
            wheelView.presentInView()
            didShow = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        wheelView.generateButtons(items: items, centerItem:nil)
        
        wheelView.didPressButton = { (glovoView) in
        }
  
        self.selectedItemLabel.text = selectedLabel
        let tapGest = UITapGestureRecognizer.init(target: self, action: #selector(backPressed))
        self.view.addGestureRecognizer(tapGest)
    }
    
    
    func setupNavigationBar(){
        // self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc @IBAction func backPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
