//
//  HomeProtocols.swift
//  Tap2School
//
//  Created by Hilal  Al Hakkani on 11/4/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import GlovoViewFramework


//MARK: PRESENTER -> View

protocol HomeViewProtocol: class {
    
    // PRESENTER -> VIEW
    var presenter:HomePresenterProtocol? { get set }
    func didFetchProfile()
}


//MARK: View -> Presenter

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER

    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func navigateToNotifications()
    func navigateToProfile()
    func navigateToBubbleDetails(item:GlovoView)
    func navigateToChat()
    func fetchProfile()

  }



//MARK: PRESENTER -> Router

protocol HomeRouterProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> HomeViewController
    func navigateToProfile(from view: HomeViewProtocol?)
    func navigateToNotifications(from view: HomeViewProtocol?)
    func navigateTo(from view: HomeViewProtocol?,glovoView:GlovoView)
    func navigateToChat(from view: HomeViewProtocol)

    var selectedView: GlovoView! { get set }

 }

// Might be used Later on

////MARK: PRESENTER -> Interactor

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR

     var presenter: HomeInteractorOutputProtocol? { get set }
}



//MARK: Interactor -> PRESENTER

protocol HomeInteractorOutputProtocol: class {
     func didFetchProfile()
     func onError(message:String)
    func didUpdateProfile()
}


//MARK: Interactor -> DATAMANAGER
 protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER

}

//MARK: Interactor -> REMOTEDATAMANAGER

protocol HomeRemoteDataManagerInputProtocol: class {

    // INTERACTOR -> REMOTEDATAMANAGER
//    var remoteRequestHandler: ProfileRemoteDataManagerOutputProtocol? { get set }
//    func getProfileDetails()

 }


//MARK: REMOTEDATAMANAGER -> INTERACTOR

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
//    func didFetchProfile()
//    func onError(message:String)
}



