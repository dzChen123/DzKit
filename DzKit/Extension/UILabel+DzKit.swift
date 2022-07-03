//
//  UILabel+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/7/1.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String = "", textColor: UIColor = .black, fontSize: CGFloat, fontWeight: UIFont.Weight = .regular) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    }
}
