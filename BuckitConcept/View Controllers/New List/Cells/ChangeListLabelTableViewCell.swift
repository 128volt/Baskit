//
//  ChangeListLabelTableViewCell.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 30.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class ChangeListLabelTableViewCell: SelectionColorTableViewCell {

	@IBOutlet weak var customLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
