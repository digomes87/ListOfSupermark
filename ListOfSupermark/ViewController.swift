//
//  ViewController.swift
//  ListOfSupermark
//
//  Created by Diego Gomes on 11/11/2015.
//  Copyright © 2015 Nylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var labelText: UITextField!
    @IBOutlet var listCell: UITableView!
    @IBAction func addlist(sender: AnyObject) {
        
        let newitem = labelText.text
        items.append(newitem!)
        labelText.resignFirstResponder()
        labelText.text = ""
        listCell.reloadData() //essa linha que vai atualizar a lista no cell
    }

    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int ) -> Int{
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.redColor()
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     
        let selectRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if selectRow.accessoryType == UITableViewCellAccessoryType.None {
            selectRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectRow.tintColor = UIColor.greenColor()
        }else {
            selectRow.accessoryType = UITableViewCellAccessoryType.None
        }
    }

    //function para selecionar e excluir lista de compras
    //
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let delectedRow:UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            delectedRow!.accessoryType = UITableViewCellAccessoryType.None
        }
    }
}

