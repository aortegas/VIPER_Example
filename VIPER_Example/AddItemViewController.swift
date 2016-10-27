//
//  AddItemViewController.swift
//  VIPER_Example
//
//  Created by Alberto on 10/10/16.
//  Copyright © 2016 aortegas. All rights reserved.
//

import UIKit

final class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var item: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var labelErrorDescription: UILabel!
    
    var presenter: AddItemPresenterProtocol?
    

    //MARK: Init.
    init() {
        super.init(nibName: "AddItemView", bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add item to shopping list"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self,
                                                                action: #selector(AddItemViewController.cancelNewItem))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self,
                                                                 action: #selector(AddItemViewController.saveNewItem))
    }


    // MARK: - Actions
    func cancelNewItem(_ sender: AnyObject) {
        presenter?.cancelNewItem()
    }
    
    func saveNewItem(_ sender: AnyObject) {
        
        labelErrorDescription.text = ""
        presenter?.saveNewItem(nameItem: item.text!, amountItem: amount.text!)
    }
}


extension AddItemViewController: AddItemViewProtocol {

    // MARK: - Responses
    func errorSaveItem(_ errorDescription: String) {
        labelErrorDescription.text = errorDescription
    }
}
