//
//  ItemListTableViewController.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.sharedController.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        
        let item = ItemController.sharedController.items[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let item = ItemController.sharedController.items[indexPath.row]
            
            ItemController.sharedController.removeItem(item)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "itemCellSegue" {
            
            if let detailViewController = segue.destinationViewController as?
                ItemDetailViewController {
                    
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let item = ItemController.sharedController.items[selectedRow]
                    detailViewController.updateWithItem(item)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
