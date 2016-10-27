//
//  TableRouting.swift
//  VIPER_Example
//
//  Created by Alberto on 13/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import UIKit

final class TableRouting {
    
    // MARK: Properties
    var navigationController: UINavigationController

    
    // MARK: Public
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}


extension TableRouting: TableRoutingProtocol {
    
    // MARK: - Functions
    func presentTableInterfaceFromWindow(_ window: UIWindow) {
        
        // Create Interactor
        let tableInteractor = TableInteractor()
        
        // Create View
        let tableViewController = TableViewController()
        self.navigationController.setViewControllers([tableViewController], animated: true)
        
        // Create Presenter
        let tablePresenter = TablePresenter()
        tablePresenter.interactor = tableInteractor
        tablePresenter.routing = self
        tableInteractor.presenter = tablePresenter
        
        tableViewController.presenter = tablePresenter
        tablePresenter.view = tableViewController
        
        window.rootViewController = navigationController
    }
    
    func addNewItem() {
        
        let addItemRouting = AddItemRouting(navigationController: navigationController)
        addItemRouting.presentAddItemInterface()
    }
}
