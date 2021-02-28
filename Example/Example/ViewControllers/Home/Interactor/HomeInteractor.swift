//
//  HomeInteractor.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 11/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class HomeInteractor:HomeInteractorInputProtocol {
    
    var presenter: HomeInteractorOutputProtocol?
 
    func didFetchProfile() {
        presenter?.didFetchProfile()
    }
 
    func getProfileApiCall() {
   
    }
    func onError(message: String) {
        presenter?.onError(message: message)
    }
    
    func didUpdateProfile() {
        self.presenter?.didUpdateProfile()
    }
}
