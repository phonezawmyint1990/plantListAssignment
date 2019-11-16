//
//  RoundTextField.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 14/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//
import UIKit
import Foundation

class RoundTextField: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderStyle = .none
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.backgroundColor = UIColor.white.cgColor
    }
}
