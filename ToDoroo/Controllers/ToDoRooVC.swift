//
//  ViewController.swift
//  ToDoroo
//
//  Created by Ronit Tushir on 09/07/18.
//  Copyright © 2018 Ronit Tushir. All rights reserved.
//

import UIKit

class ToDoRooVC: UITableViewController {
    
    var itemArray = [item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let item1 = item()
//        item1.title="pls work"
//        itemArray.append(item1)
//        if let items = defaults.array(forKey: "Our Array") as? [item] {
//            itemArray = items
//        }
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "OurArray") as? [String] {
//            itemArray = items
//        }
    }

    //MARK - TableVCDataSourceMethods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoRooItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        if itemArray[indexPath.row].check == true {
         cell.accessoryType = .checkmark
        }
        else
        {
            cell.accessoryType = .none
            
        }
        return cell
    }
    
    //MARK - TableVCDelegateMethods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if itemArray[indexPath.row].check == false {
            itemArray[indexPath.row].check = true
        }
        else
        {
            itemArray[indexPath.row].check = false
        }
        //print (indexPath.row)
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else
//        {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    //Mark - AddNewItems
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //what happens when button pressed
            let newitem = item()
            newitem.title=textfield.text!
         self.itemArray.append(newitem)
//         self.defaults.set(self.itemArray, forKey: "OurArray")
//
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new item here"
            textfield = alertTextField
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}

