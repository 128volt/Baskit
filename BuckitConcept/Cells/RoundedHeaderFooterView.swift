//
//  RoundedHeaderFooterView.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 27.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class RoundedHeaderFooterView: UITableViewHeaderFooterView {
	typealias Class = RoundedHeaderFooterView
	
	enum RectCorners {
		case top, bottom
	}

	weak var topView: UIView!
	weak var bottomView: UIView!
	weak var topSpacing: NSLayoutConstraint!
	
	var horizontalPadding: CGFloat = 5
	static var verticalSpacing: CGFloat = 4
	static var height: CGFloat { return viewHeight + verticalSpacing }
	
	static private var viewHeight: CGFloat = 5

	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)

		let topView = UIView()
		topView.translatesAutoresizingMaskIntoConstraints = false
		let bottomView = UIView()
		bottomView.translatesAutoresizingMaskIntoConstraints = false
		
		self.contentView.addSubview(topView)
		self.contentView.addSubview(bottomView)
		
		NSLayoutConstraint.activate([
			topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
			topView.heightAnchor.constraint(equalToConstant: Class.viewHeight),
			
			bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: Class.viewHeight / -2),
			bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
			bottomView.heightAnchor.constraint(equalToConstant: Class.viewHeight)
			])
		
		// Vertical spacing dynamic constraint
		self.topSpacing = topView.topAnchor.constraint(equalTo: contentView.topAnchor)
		self.topSpacing.isActive = true
		
		// Leading constraints with medium priority (avoiding warning when collapsing)
		let leftConstraintTopView = topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding)
		leftConstraintTopView.priority = 750
		leftConstraintTopView.isActive = true
		
		let leftConstraintBottomView = bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding)
		leftConstraintBottomView.priority = 750
		leftConstraintBottomView.isActive = true
		
		self.topView = topView
		self.bottomView = bottomView
	}
	
	@available(*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func change(position: RectCorners) {
		switch position {
		case .top:
			topView.layer.cornerRadius = 4
			bottomView.layer.cornerRadius = 0
			topSpacing.constant = Class.verticalSpacing
		case .bottom:
			topView.layer.cornerRadius = 0
			bottomView.layer.cornerRadius = 4
			topSpacing.constant = 0
		}
	}
	
	var sectionColor: UIColor? {
		get { return topView.backgroundColor }
		set {
			topView.backgroundColor = newValue
			bottomView.backgroundColor = newValue
		}
	}
	
}
