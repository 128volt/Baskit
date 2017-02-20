//
//  SubtaskCellViewModel.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 30.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

struct SubtaskCellViewModel {
	var text: String
	var color: UIColor
	var due: String
	
	init(from subtask: Subtask) {
		self.text = subtask.text
		self.color = subtask.color
		self.due = subtask.due
	}
}
