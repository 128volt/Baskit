//
//  ViewController.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 26.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var dataController: TableViewDataController!
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var createNewListButton: UIButton!
	
	var searchController: UISearchController!
	
	var isTableScrolledToTop = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		dataController = TableViewDataController(tableView: tableView)
		
		dataController.registerNibs(for: self.tableView)
		
		tableView.backgroundColor = ThemeColor.backgroundGray
		tableView.separatorStyle = .none
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 50
		
		tableView.dataSource = dataController
		tableView.delegate = dataController
		
		setupSearchController()
		
		tabBarController?.tabBar.tintColor = ThemeColor.tabBarTint
	}
	
	func setupSearchController() {
		let searchController = UISearchController(searchResultsController: nil)
		
		searchController.hidesNavigationBarDuringPresentation = false
		searchController.dimsBackgroundDuringPresentation = false

		// Customize text field
		let searchTextField = searchController.searchBar.value(forKey: "_searchField") as? UITextField
		searchTextField?.backgroundColor = ThemeColor.searchBar
		
		self.navigationItem.titleView = searchController.searchBar
		self.searchController = searchController
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let topInset = createNewListButton.frame.size.height + topLayoutGuide.length
		
		let newInsets = UIEdgeInsets(top: topInset, left: 0, bottom: self.bottomLayoutGuide.length, right: 0)
		if tableView.contentInset == newInsets { return }
		
		tableView.contentInset = newInsets
		tableView.scrollIndicatorInsets = newInsets
		
		if !isTableScrolledToTop {
			tableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
			isTableScrolledToTop = true
		}
	}
	
	@IBAction func createNewListTapped(_ sender: UIButton) {
		let newListNavController = Storyboard.changeList.instantiateInitialViewController()!
		let changeListVC = newListNavController.childViewControllers.first as! ChangeListViewController
		changeListVC.dataSourceController = self.dataController
		
		self.present(newListNavController, animated: true, completion: nil)
	}


	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

