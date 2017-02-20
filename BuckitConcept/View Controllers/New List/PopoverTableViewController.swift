//
//  PopoverTableViewController.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 30.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class PopoverTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		self.tableView.layoutIfNeeded()
		
		var cSize = tableView.contentSize
		cSize.width = 150
		self.preferredContentSize = cSize
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
		return .none
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		self.dismiss(animated: true, completion: nil)
	}
}
