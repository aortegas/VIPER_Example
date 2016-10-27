//
//  TablePresenter.swift
//  VIPER_Example
//
//  Created by Alberto on 12/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import UIKit

final class TablePresenter {
    
    // MARK: - Properties
    weak var view: TableViewProtocol?
    var routing: TableRouting?
    var interactor: TableInteractorProtocol?
}


extension TablePresenter: TablePresenterProtocol {

    // MARK: - Actions
    func addNewItem() {
        routing?.addNewItem()
    }
    
    func fetchItems() {
        interactor?.fetchItems()
    }
    
    // MARK: - Responses
    func responseItems(items: [Entity]?) {
    
        var viewModel: [String]? = []
        
        // Convert business models in view models.
        if let items = items {
            for item in items {
            
                let itemViewModel = String(format: "%@ %d", item.name!, item.amount!)
                viewModel?.append(itemViewModel)
            }
        }

        view?.responseItems(items: viewModel)
    }
}
