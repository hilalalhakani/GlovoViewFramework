//
//  HomePresenter.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 11/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import GlovoViewFramework

class HomePresenter:HomePresenterProtocol,HomeInteractorOutputProtocol {
  
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    
    var router: HomeRouterProtocol?
    
    func navigateToProfile() {
        router?.navigateToProfile(from: view)
    }
    
    func navigateToNotifications() {
        router?.navigateToNotifications(from: view)
    }
 
    func navigateToBubbleDetails(item: GlovoView) {
        router?.navigateTo(from: view, glovoView: item)
    }
    func navigateToChat() {
        guard let view = view else { return }
        router?.navigateToChat(from: view)
    }
    func didFetchProfile() {
        view?.didFetchProfile()
    }
    func onError(message:String){
        
    }

    func fetchProfile() {

    }
    
    func didUpdateProfile() {
         
    }
}
