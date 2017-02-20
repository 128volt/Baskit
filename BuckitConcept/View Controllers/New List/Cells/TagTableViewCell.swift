//
//  TagTableViewCell.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 30.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		let backView = UIView()
		backView.backgroundColor = UIColor(hex: "009CD6").darkerColor(by: 0.2)
		
		self.selectedBackgroundView = backView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
