//
//  SelectionColorTableViewCell.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 31.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class SelectionColorTableViewCell: UITableViewCell {

	@IBInspectable var selectedColor: UIColor? {
		didSet {
			let backgroundView = UIView()
			backgroundView.backgroundColor = selectedColor
			self.selectedBackgroundView = backgroundView
		}
	}

}
