//
//  ButtonBorders.swift
//  Homework 3.1 Calculator
//
//  Created by spezza on 24.12.2020.
//

import UIKit

@IBDesignable class BorderButton: UIButton {}

extension BorderButton {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
