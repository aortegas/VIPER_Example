//
//  DataBase.swift
//  VIPER_Example
//
//  Created by Alberto on 21/10/2016.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

final class DataBase {

    // MARK: - Properties
    var items: [Entity] = []
    
    // MARK: - Shared Instance
    static let sharedInstance: DataBase = DataBase()
    
    // Can't init is singleton
    private init() {}
    
    // MARK: - Functions
    func addItemToDataBase(nameItem name: String, amountItem amount: String) {
        
        // Create new item and add to data base
        let newItem: Entity = Entity()
        newItem.name = name
        newItem.amount = UInt(amount)
        items.append(newItem)
    }
    
    func fetchItems() -> [Entity] {
        return items
    }
}





