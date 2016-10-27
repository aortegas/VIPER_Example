//
//  TablePresenterProtocol.swift
//  VIPER_Example
//
//  Created by Alberto on 13/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

protocol TablePresenterProtocol: class {
    func addNewItem()
    func fetchItems()
    func responseItems(items: [Entity]?)
}
