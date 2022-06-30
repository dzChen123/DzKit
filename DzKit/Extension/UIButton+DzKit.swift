//
//  UIButton+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/6/30.
//

import Foundation
import UIKit

enum DzButtonImageTitlePosition: Int {       //leftRight: 即为图左文右；其他的依次类推
    case leftRight = 0
    case rightLeft
    case topBottom
    case bottomTop
}

extension UIButton {
    convenience init(title: String = "", titleColor: UIColor = .black, titleFont: UIFont = .systemFont(ofSize: 14), image: String = "") {
        self.init()
     
        dzTitle(title).dzTitleColor(titleColor).dzTitleFont(titleFont)
        dzImage(image)
    }
    
    @discardableResult
    func dzTitle(_ title: String, for state: UIControl.State = .normal) -> UIButton {
        if !title.isEmpty {
            setTitle(title, for: state)
        }
        return self
    }
    
    @discardableResult
    func dzTitleColor(_ color: UIColor, for state: UIControl.State = .normal) -> UIButton {
        setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func dzTitleFont(_ font: UIFont) -> UIButton {
        titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func dzImage(_ image: String, for state: UIControl.State = .normal) -> UIButton {
        if !image.isEmpty {
            setImage(.init(named: image), for: state)
        }
        return self
    }
    
    //按钮的图文剧中
    func relayoutImageTitle(with space: CGFloat, position: DzButtonImageTitlePosition) {
        layoutIfNeeded()
        
        let space_half = space / 2.0
        let img_rect = imageView?.frame ?? .zero
        let title_rect = titleLabel?.frame ?? .zero
        
        var img_left: CGFloat = 0
        var img_top: CGFloat = 0
        var title_left: CGFloat = 0
        var title_top: CGFloat = 0
        if position.rawValue <= 1 {
            if position == .leftRight {
                img_left = -space_half
                title_left = space_half
            } else {
                img_left = title_rect.width + space_half
                title_left = -(img_rect.width + space_half)
            }
            imageEdgeInsets = .init(top: img_top, left: img_left, bottom: -img_top, right: -img_left)
            titleEdgeInsets = .init(top: title_top, left: title_left, bottom: -title_top, right: -title_left)
        } else {
            var title_right: CGFloat = 0
            img_left = title_rect.width / 2.0
            title_left = -img_rect.width / 2.0
            title_right = -title_left
            if position == .topBottom {
                img_top = -(title_rect.height + space) / 2.0
                title_top = (img_rect.height + space) / 2.0
            } else {
                img_top = (title_rect.height + space) / 2.0
                title_top = -(img_rect.height + space) / 2.0
            }
            let text_width = NSString.init(string: titleLabel?.text ?? "").size(withAttributes: [.font: titleLabel!.font as Any]).width
            if title_rect.width < text_width {
                let check = (text_width - title_rect.width) / 2.0
                title_left -= check
                title_right -= check
                img_left += img_rect.minX
            }
            imageEdgeInsets = .init(top: img_top, left: img_left, bottom: -img_top, right: -img_left)
            titleEdgeInsets = .init(top: title_top, left: title_left, bottom: -title_top, right: title_right)
        }
        
    }
}
