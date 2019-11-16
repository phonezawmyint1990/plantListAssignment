//
//  Extensions.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 14/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//
import  UIKit
import Foundation
extension UIView{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UIImageView{
    func roudTopCorner(radius: CGFloat = 10){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    func roudBottomCorner(radius: CGFloat = 30){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMaxYCorner]
    }
}


