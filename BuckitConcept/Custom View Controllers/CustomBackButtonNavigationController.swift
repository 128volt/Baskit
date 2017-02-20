//
//  CustomBackButtonNavigationController.swift
//  BuckitConcept
//
//  Created by Vasily Ulianov on 31.01.17.
//  Copyright © 2017 Wallace Neel. All rights reserved.
//

import UIKit

class CustomBackButtonNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

	@IBInspectable var backButtonImage: UIImage?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.delegate = self
		self.interactivePopGestureRecognizer?.delegate = self
    }

	func backButtonTapped() {
		self.popViewController(animated: true)
	}
	
	var isRootViewControllerPresented: Bool {
		return (self.childViewControllers.count == 1)
	}
	
	func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		return !isRootViewControllerPresented
	}
	
	func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
		if !isRootViewControllerPresented {
			viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(self.backButtonTapped))
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
