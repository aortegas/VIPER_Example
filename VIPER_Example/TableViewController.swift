//
//  TableViewController.swift
//  VIPER_Example
//
//  Created by Alberto on 10/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    
    // MARK: - Properties
    var presenter: TablePresenterProtocol?
    var shoppingListItems = [String]()
    
    
    //MARK: Init.
    init() {        
        super.init(nibName: "TableView", bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Make a shopping list"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                                                 action: #selector(TableViewController.addNewItem))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Request data.
        presenter?.fetchItems()
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = shoppingListItems[(indexPath as NSIndexPath).row];
        return cell
    }
    
    
    // MARK: - Actions
    func addNewItem() {
        presenter?.addNewItem()
    }
}


extension TableViewController: TableViewProtocol {
    
    func responseItems(items: [String]?) {
        
        if let items = items,
                items.count > 0 {
            shoppingListItems = items
            tableView.reloadData()
        }
    }
}
