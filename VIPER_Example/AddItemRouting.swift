//
//  AddItemRouting.swift
//  VIPER_Example
//
//  Created by Alberto on 13/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import UIKit

final class AddItemRouting {
    
    // MARK: Properties
    var navigationController: UINavigationController
    
    
    // MARK: Public
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}


extension AddItemRouting: AddItemRoutingProtocol {
    
    // MARK: - Functions
    func presentAddItemInterface() {
        
        // Create Interactor
        let addItemInteractor = AddItemInteractor()
        
        // Create View
        let addItemViewController = AddItemViewController()
        
        // Create Presenter
        let addItemPresenter = AddItemPresenter()
        addItemPresenter.interactor = addItemInteractor
        addItemPresenter.routing = self
        addItemInteractor.presenter = addItemPresenter
        
        addItemViewController.presenter = addItemPresenter
        addItemPresenter.view = addItemViewController
        
        navigationController.pushViewController(addItemViewController, animated: true)
    }
    
    func cancelNewItem() {
        navigationController.popViewController(animated: true)
    }
    
    func saveNewItemOK() {
        navigationController.popViewController(animated: true)
    }
}
