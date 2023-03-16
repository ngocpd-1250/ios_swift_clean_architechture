//
//  UIView+.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import UIKit

extension UIView {
    func rounded(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

// MARK: - IBInspectable
extension UIView {
    @IBInspectable public var borderColor: UIColor {
        get {
            let color = layer.borderColor ?? UIColor.white.cgColor
            return UIColor(cgColor: color) // not using this property as such
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            rounded(cornerRadius: newValue)
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowAlpha: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}
