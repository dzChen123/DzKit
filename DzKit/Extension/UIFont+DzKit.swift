//
//  UIFont+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/7/1.
//

import Foundation
import UIKit

extension UIFont {

    static func logAllFontNames() {
        let fontFamilies = UIFont.familyNames
        for fontFamily in fontFamilies {
            let fontNames = UIFont.fontNames(forFamilyName: fontFamily)
            print("fontNames : \n\(fontNames)")
        }
    }

}
