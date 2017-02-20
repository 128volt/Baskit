//
//  TableViewData.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 28.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class TableViewDataController: NSObject {
	let dataSource: FakeDataSource = FakeDataSource()
	unowned let tableView: UITableView
	
	struct identifiers {
		static let listCell = "ListTableViewCell"
		static let subtaskCell = "SubtaskTableViewCell"
		static let section = "RoundedHeaderFooterView"
	}
	
	init(tableView: UITableView) {
		self.dataSource.fill()
		self.tableView = tableView
		super.init()
	}
	
	func registerNibs(for tableView: UITableView) {
		let nib = UINib(nibName: identifiers.listCell, bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: identifiers.listCell)
		
		let subtaskNib = UINib(nibName: identifiers.subtaskCell, bundle: nil)
		tableView.register(subtaskNib, forCellReuseIdentifier: identifiers.subtaskCell)
		
		tableView.register(RoundedHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: identifiers.section)
	}
	
	func add(list: List) {
		self.dataSource.lists.append(list)
		
		let sectionNumber = dataSource.lists.count - 1
		let index: IndexSet = [sectionNumber]
		tableView.insertSections(index, with: .top)
	}
}

extension TableViewDataController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return dataSource.lists.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let selectedList = dataSource.lists[section]
		let subtasks = selectedList.subtasks
		
		if subtasks.isEmpty || !selectedList.isExpanded {
			return 1
		} else {
			return subtasks.count + 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let list = dataSource.lists[indexPath.section]
		
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.listCell, for: indexPath) as! ListTableViewCell
			cell.viewModel = ListCellModel(from: list, onAddThing: { [weak self] in
				guard let newThing = self?.dataSource.makeRandomSubtask(color: list.color) else { return }
				list.subtasks.append(newThing)
				let newIndexPath = IndexPath(row: list.subtasks.count, section: indexPath.section)
				DispatchQueue.main.async {
					self?.tableView.insertRows(at: [newIndexPath], with: .top)
				}
			})
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.subtaskCell, for: indexPath) as! SubtaskTableViewCell
			cell.viewModel = SubtaskCellViewModel(from: list.subtasks[indexPath.row - 1])
			return cell
		}
	}
}

extension TableViewDataController: UITableViewDelegate {
	
	// MARK: - Header View
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifiers.section) as! RoundedHeaderFooterView
		return view
	}
	
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		let sectionView = view as! RoundedHeaderFooterView
		sectionView.change(position: .top)
		sectionView.sectionColor = dataSource.lists[section].color
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return RoundedHeaderFooterView.height
	}
	
	// MARK: - Footer View
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifiers.section) as! RoundedHeaderFooterView
		return view
	}
	
	func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
		let sectionView = view as! RoundedHeaderFooterView
		sectionView.change(position: .bottom)
		sectionView.sectionColor = dataSource.lists[section].color
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return RoundedHeaderFooterView.height
	}
	
	// MARK: - Cell tap
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row != 0 || dataSource.lists[indexPath.section].subtasks.isEmpty { return }
		
		let list = dataSource.lists[indexPath.section]
		list.isExpanded = !list.isExpanded
		
		let subtasksPaths = self.subtasksPaths(section: indexPath.section)
		if list.isExpanded {
			tableView.insertRows(at: subtasksPaths, with: .top)
		} else {
			tableView.deleteRows(at: subtasksPaths, with: .top)
		}
	}
	
	func subtasksPaths(section: Int) -> [IndexPath] {
		let list = dataSource.lists[section]
		
		var indexPaths = [IndexPath]()
		for i in 0 ..< list.subtasks.count {
			let newPath = IndexPath(row: i + 1, section: section)
			indexPaths.append(newPath)
		}
		
		return indexPaths
	}
}
