//
//  SubtaskTableViewCell.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 26.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class SubtaskTableViewCell: UITableViewCell {

	@IBOutlet weak var dueLabel: UILabel!
	@IBOutlet weak var geoLabel: UILabel!
	@IBOutlet weak var tagLabel: UILabel!
	@IBOutlet weak var rightBottomLabel: UILabel!
	@IBOutlet weak var roundDotView: RoundedView!
	@IBOutlet weak var paddingContainerView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	var viewModel: SubtaskCellViewModel? {
		didSet {
			if let model = viewModel {
				setup(with: model)
			}
		}
	}
	
	private func setup(with model: SubtaskCellViewModel) {
		self.dueLabel.text = model.due
		self.titleLabel.text = model.text
		
		// Colors
		paddingContainerView.backgroundColor = model.color.lighter(by: 0.1)
		tagLabel.backgroundColor = model.color
		roundDotView.backgroundColor = model.color
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	var sectionColor: UIColor? {
		get {
			return tagLabel.backgroundColor
		}
		set {

		}
	}
    
	@IBAction func moreButtonTapped(_ sender: UIButton) {
		
	}
}
