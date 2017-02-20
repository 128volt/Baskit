//
//  ListTableViewCell.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 26.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var itemsLabel: UILabel!
	@IBOutlet weak var tagLabel: RoundedLabel!
	@IBOutlet weak var containerView: UIView!
	
	var viewModel: ListCellModel? {
		didSet {
			guard let model = viewModel else { return }
			setup(with: model)
		}
	}
	
	private func setup(with model: ListCellModel) {
		containerView.backgroundColor = model.color
		tagLabel.backgroundColor = model.color.lighter(by: 0.1)
		itemsLabel.text = model.itemsText
		titleLabel.text = model.text
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func addTapped(_ sender: UIButton) {
		viewModel?.addThingTapped()
	}
}
