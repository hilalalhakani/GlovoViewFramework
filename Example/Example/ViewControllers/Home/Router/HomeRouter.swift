//
//  HomeRouter.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 11/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import GlovoViewFramework

class HomeRouter:NSObject,HomeRouterProtocol, UIViewControllerTransitioningDelegate{
    
    
    var selectedView: GlovoView!
    
    
    let transition = BubbleTransition()
    
    static func createHomeModule() -> HomeViewController {
        let view = HomeViewController.instantiate()
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol  = HomeInteractor()
        let router: HomeRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
 
        return view
    }
    
    
    func navigateToProfile(from view: HomeViewProtocol?) {
       
      
    }
    
    func navigateToNotifications(from view: HomeViewProtocol?) {
     
    }
    
    func navigateTo(from view: HomeViewProtocol?, glovoView: GlovoView) {
        
        guard let sourceView = view as? UIViewController else {fatalError()}
         self.selectedView = glovoView
        
        let bubbleDetails = BubbleDetailsViewController.instantiate()
        bubbleDetails.selectedLabel = selectedView.label.text
        if let items  = selectedView.glovoItem?.subItems {
            bubbleDetails.items = items
            let navController = UINavigationController.init(rootViewController: bubbleDetails)
            navController.transitioningDelegate = self
            navController.modalPresentationStyle = .custom
            sourceView.present(navController, animated: true)
        }
        
    }
    
    func navigateToChat(from view: HomeViewProtocol) {
    }
}


extension HomeRouter  {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = BubbleTransition.BubbleTransitionMode.present
        transition.startingPoint = selectedView.superview!.convert(selectedView.originalCenter, to: self.selectedView.rootView())
        transition.bubbleColor = #colorLiteral(red: 0.2844161391, green: 0.6725138426, blue: 1, alpha: 1)
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = selectedView.superview!.convert(selectedView.originalCenter, to: self.selectedView.rootView())
        transition.bubbleColor = #colorLiteral(red: 0.2844161391, green: 0.6725138426, blue: 1, alpha: 1)
        return transition
    }
    
}



extension UIView {
    func rootView() -> UIView {
        return superview?.rootView() ?? superview ?? self
    }
}
