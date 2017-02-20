//
//  ListCellModel.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 30.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

struct ListCellModel {
	var text: String
	var color: UIColor
	
	var itemsText: String
	
	typealias AddThingHandler = () -> ()
	var addThing: AddThingHandler
	
	init(from list: List, onAddThing: @escaping AddThingHandler) {
		self.text = list.text
		self.color = list.color
		
		self.itemsText = String(list.subtasks.count) + " items"
		self.addThing = onAddThing
	}
	
	func addThingTapped() {
		addThing()
	}
}
