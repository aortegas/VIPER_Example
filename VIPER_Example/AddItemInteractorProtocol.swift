//
//  AddItemInteractorProtocol.swift
//  VIPER_Example
//
//  Created by Alberto on 13/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

protocol AddItemInteractorProtocol: class {
    func saveNewItem(nameItem name: String, amountItem amount: String)
}

