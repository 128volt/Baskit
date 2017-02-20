//
//  UIColor+Hex.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 27.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

public extension UIColor {
	
	/// Initializes and returns a color object using the specified hex value
	///
	/// - Parameter hex: hex value, example: `#ffffff` or `ffffff`
	public convenience init(hex: String) {
		let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
		let scanner = Scanner(string: hexString)
		
		if (hexString.hasPrefix("#")) {
			scanner.scanLocation = 1
		}
		
		var color: UInt32 = 0
		scanner.scanHexInt32(&color)
		
		let mask = 0x000000FF
		let r = Int(color >> 16) & mask
		let g = Int(color >> 8) & mask
		let b = Int(color) & mask
		
		let red   = CGFloat(r) / 255.0
		let green = CGFloat(g) / 255.0
		let blue  = CGFloat(b) / 255.0
		
		self.init(red: red, green: green, blue: blue, alpha:1)
	}
	
	/// Returns hex value of a color object.
	var hex: String {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		
		getRed(&r, green: &g, blue: &b, alpha: &a)
		
		let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
		
		return String(format:"#%06x", rgb)
	}
	
}

extension UIColor {
	func lighter(by percent: Double) -> UIColor {
		return colorWithBrightnessFactor(CGFloat(1 + percent));
	}
	
	func darkerColor(by percent: Double) -> UIColor {
		return colorWithBrightnessFactor(CGFloat(1 - percent));
	}
	
	private func colorWithBrightnessFactor(_ factor: CGFloat) -> UIColor {
		var hue : CGFloat = 0
		var saturation : CGFloat = 0
		var brightness : CGFloat = 0
		var alpha : CGFloat = 0
		
		if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
			return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
		} else {
			return self;
		}
	}
}
