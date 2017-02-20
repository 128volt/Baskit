//
//  ChangeListViewController.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 29.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class ChangeListViewController: UIViewController {

	@IBOutlet weak var tableBottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var tagButton: UIButton!
	
	var dataSourceController: TableViewDataController!
	
	var dynamicConstraintController: KeyboardRelatedConstraintAnimator!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.dynamicConstraintController = KeyboardRelatedConstraintAnimator(constraint: tableBottomConstraint, in: self.view)
		tableView.transform = CGAffineTransform (scaleX: 1,y: -1)
		tableView.dataSource = self
		tableView.delegate = self
		
		// Remove shadow and navigation bar
		let img = UIImage()
		self.navigationController?.navigationBar.shadowImage = img
		self.navigationController?.navigationBar.setBackgroundImage(img, for: .default)
		
		tagButton.layer.cornerRadius = 15
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
		self.dismiss(animated: true) { 
			let newList = List(color: ThemeColor.green)
			newList.text = self.textView.text
			self.dataSourceController.add(list: newList)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let popoverVC = segue.destination as? PopoverTableViewController {
			popoverVC.popoverPresentationController?.delegate = popoverVC
			popoverVC.popoverPresentationController?.sourceView = tagButton
			popoverVC.popoverPresentationController?.sourceRect = tagButton.bounds
			popoverVC.popoverPresentationController?.backgroundColor = self.view.backgroundColor
		}
	}
}
extension ChangeListViewController: UITableViewDataSource {
	private func invert(cell: UITableViewCell) {
		cell.contentView.transform = CGAffineTransform (scaleX: 1,y: -1)
		cell.accessoryView?.transform = CGAffineTransform (scaleX: 1,y: -1)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "textField", for: indexPath)
			invert(cell: cell)
			return cell
		}
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "label", for: indexPath) as! ChangeListLabelTableViewCell
		
		switch indexPath.row {
		case 1: cell.customLabel.text = "Shared with Jacob Locauarb"
		case 2: cell.customLabel.text = "NYU Library"
		case 3: cell.customLabel.text = "Due Dec 11 at 12:00pm - 2:00pm"
		default: cell.customLabel.text = nil
		}
		
		invert(cell: cell)
		return cell

	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
}

extension ChangeListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
