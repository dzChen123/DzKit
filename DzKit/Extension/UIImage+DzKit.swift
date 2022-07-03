//
//  UIImage+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/7/1.
//

import Foundation
import UIKit

extension UIImage {
    func resize(to dimension: CGFloat) -> UIImage {     //这里回去判断一个边的长短  以短边进行缩放
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let aspectRatio = size.width / size.height
        if aspectRatio > 1 {
            width = dimension
            height = dimension / aspectRatio
        } else {
            height = dimension
            width = dimension * aspectRatio
        }
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = false
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image { (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        return newImage
    }
    
    func adjustPhotoDirectionIfNeeded() -> UIImage {        //原理是绘制的时候会丢失方向信息
        if imageOrientation == .up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width, height: size.height), false, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImg!
    }
    
    //HEIC形式的图片压缩。格式会变，失真度会比较小，占用内存较小
    func heicData(compressionQuality: CGFloat = 1.0) -> Data? {
        let heic_idetifier = "public.heic"
        guard (CGImageDestinationCopyTypeIdentifiers() as! [String]).contains(heic_idetifier) else {
            //不支持heic压缩
            print("UIImage heicData failed: unsupported device")
            return nil
        }
        guard
            let mutableData = CFDataCreateMutable(nil, 0),
            let destination = CGImageDestinationCreateWithData(mutableData, heic_idetifier as CFString, 1, nil),
            let cgImage  = cgImage
        else {
            print("UIImage heicData failed: initial data error")
            return nil
        }
        CGImageDestinationAddImage(destination, cgImage, [
            kCGImageDestinationLossyCompressionQuality: compressionQuality,
            kCGImageDestinationOrientation: CGImagePropertyOrientation.up.rawValue
        ] as CFDictionary)
        guard CGImageDestinationFinalize(destination) else {
            print("UIImage heicData failed: CGImageDestinationFinalize error")
            return nil
        }
        return mutableData as Data
    }
}
