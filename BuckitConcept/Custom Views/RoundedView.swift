//
//  RoundedView.swift
//  Consoul
//
//  Created by Vasily Ulianov on 20.10.16.
//  Copyright © 2016 Wallace Neel. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
	
	@IBInspectable var cornerRadius: CGFloat = 5 {
		didSet {
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0
		}
	}
	
}
