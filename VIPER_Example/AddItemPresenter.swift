//
//  AddItemPresenter.swift
//  VIPER_Example
//
//  Created by Alberto on 12/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

final class AddItemPresenter {
    
    // MARK: - Properties
    weak var view: AddItemViewProtocol?
    var routing: AddItemRouting?
    var interactor: AddItemInteractorProtocol?
}


extension AddItemPresenter: AddItemPresenterProtocol {

    // MARK: - Actions
    func cancelNewItem() {
        routing?.cancelNewItem()
    }
    
    func saveNewItem(nameItem name: String, amountItem amount: String) {
        interactor?.saveNewItem(nameItem: name, amountItem: amount)
    }

    // MARK: - Responses
    func errorSaveItem(_ errorDescription: String) {
        view?.errorSaveItem(errorDescription)
    }
    
    func saveItemOk() {
        routing?.saveNewItemOK()
    }
}
