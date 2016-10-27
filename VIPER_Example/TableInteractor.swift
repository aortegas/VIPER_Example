//
//  TableInteractor.swift
//  VIPER_Example
//
//  Created by Alberto on 12/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import Foundation

final class TableInteractor {
    
    // MARK: - Properties
    weak var presenter: TablePresenterProtocol?
    weak var dataBase : DataBase? = DataBase.sharedInstance
}


extension TableInteractor: TableInteractorProtocol {
    
    // MARK: - Functions for fetch items.
    func fetchItems() {
        
        // Response Items
        let items: [Entity]? = dataBase?.fetchItems()
        presenter?.responseItems(items: items)
    }
}

