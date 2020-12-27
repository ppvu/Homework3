//
//  RoundedButton.swift
//  Task4
//
//  Created by spezza on 27.12.2020.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {

}

extension RoundedButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
