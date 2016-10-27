//
//  AddItemPresenterProtocol.swift
//  VIPER_Example
//
//  Created by Alberto on 13/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

protocol AddItemPresenterProtocol: class {
    func cancelNewItem()
    func saveNewItem(nameItem name: String, amountItem amount: String)
    func errorSaveItem(_ errorDescription: String)
    func saveItemOk()
}
