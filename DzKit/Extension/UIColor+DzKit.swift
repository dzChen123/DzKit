//
//  UIColor+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/6/30.
//

import Foundation
import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        UIColor( red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 0.5)
    }
    
    static func hexColor(withRgb rgb: String, alpha: Double = 1) -> UIColor {
        if rgb.count < 7 {
            return .clear
        }
        var rgbStr = rgb
        if rgb.hasPrefix("0X") || rgb.hasPrefix("0x") {
            let index = rgb.index(rgb.startIndex, offsetBy: 2)
            rgbStr = String(rgb[index...])
        } else if rgb.hasPrefix("#") {
            let index = rgb.index(rgb.startIndex, offsetBy: 1)
            rgbStr = String(rgb[index...])
        } else {
            return UIColor.clear
        }
        var rgbValue: UInt32 = 0
        Scanner(string: rgbStr).scanHexInt32(&rgbValue)
        return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(alpha))
    }
    
    func hexString() -> String {
        let components = cgColor.components!
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        return String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}


