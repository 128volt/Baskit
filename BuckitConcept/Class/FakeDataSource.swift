//
//  FakeDataSource.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 27.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import Foundation
import UIKit

class List {
	var subtasks = [Subtask]()
	var isExpanded = true
	
	var color: UIColor
	var text = String()
	
	init(color: UIColor) {
		self.color = color
	}
}

class Subtask {
	var color: UIColor
	var text = String()
	var due = String()
	
	init(color: UIColor) {
		self.color = color
	}
}

class FakeDataSource {
	var lists = [List]()
	var colors = [ThemeColor.blue, ThemeColor.green, ThemeColor.orange, ThemeColor.violet]
	
	func fill() {
		for _ in 0...10 {
			let newList = makeRandomList()
			newList.subtasks = makeRandomSubtasks(color: newList.color)
			
			self.lists.append(newList)
		}
	}
	
	func makeRandomSubtasks(color: UIColor) -> [Subtask] {
		var subtasks = [Subtask]()
		
		if !Bool.random { return subtasks }

		for _ in 0...random(to: 5) {
			let subtask = makeRandomSubtask(color: color)
			subtasks.append(subtask)
		}
		
		return subtasks
	}
	
	func makeRandomList() -> List {
		let randomTitles = [
			"Fall semester - law school",
			"Buckit - App Development",
			"Buckit - Android App Development",
			"Misc - Random Meetings",
			"Appointments"
		]
		
		let list = List(color: colors.random)
		list.text = randomTitles.random
		return list
	}
	
	func makeRandomSubtask(color: UIColor) -> Subtask {
		let randomText = [
			"Does the shock weight the zone?",
			"Can the idea mend?",
			"Should the virtual knife count next to her misprint?",
			"Whatever vacuum boils inside the shower.",
			"The purge paces around its anomaly.",
			"The snail cautions!"
		]
		
		let dues = [
			"No due",
			"Due Today at 1:00pm - 2:00pm"
		]
		
		let subtask = Subtask(color: color)
		subtask.text = randomText.random
		subtask.due = dues.random
		return subtask
	}
}

// MARK: - Randomizers

func random(to: Int) -> Int {
	return Int(arc4random_uniform(UInt32(to)))
}

extension Array {
	var random: Element {
		let index = Int(arc4random_uniform(UInt32(self.count)))
		return self[index]
	}
}

extension Bool {
	static var random: Bool {
		return Int(arc4random_uniform(4)) == 1 ? true : false
	}
}
