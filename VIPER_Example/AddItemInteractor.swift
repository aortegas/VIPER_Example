//
//  AddItemInteractor.swift
//  VIPER_Example
//
//  Created by Alberto on 12/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

final class AddItemInteractor {
    
    // MARK: - Properties
    weak var presenter: AddItemPresenterProtocol?
    weak var dataBase : DataBase? = DataBase.sharedInstance
}


extension AddItemInteractor: AddItemInteractorProtocol {

    // MARK: - Functions por add new items to shopping list
    func saveNewItem(nameItem name: String, amountItem amount: String) {
        
        // Validate data
        validateData(nameItem: name, amountItem: amount)
        
        // Save into any DataBase
        dataBase?.addItemToDataBase(nameItem: name, amountItem: amount)
        
        // Nofify item saved
        presenter?.saveItemOk()
    }
    
    
    // MARK: - Private Functions
    private func validateData(nameItem name: String, amountItem amount: String) {
        
        if name == "" {
            presenter?.errorSaveItem("Error: You should indicate item's name")
            return
        }
        
        guard let amountUInt = UInt(amount) else {
            presenter?.errorSaveItem("Error: You should indicate item's amount")
            return
        }
        
        if amountUInt < 1 {
            presenter?.errorSaveItem("Error: You should indicate item's amount")
            return
        }
    }
}
