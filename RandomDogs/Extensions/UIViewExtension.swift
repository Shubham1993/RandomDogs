//
//  UIViewExtension.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            if newValue {
                self.layer.masksToBounds = newValue
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return .clear
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    var sizeToFitView: CGFloat {
        self.layoutIfNeeded()
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
}
