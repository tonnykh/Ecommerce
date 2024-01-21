//
//  UINavigationController.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import Foundation
import UIKit

extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
}
