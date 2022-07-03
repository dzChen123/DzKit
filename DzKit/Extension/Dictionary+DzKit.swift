//
//  Dictionary+DzKit.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/7/1.
//

import Foundation

extension Dictionary {
    func convertToJSONString() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            return String(data: data, encoding: .utf8) ?? ""
        } catch let error {
            print(error)
        }
        return ""
    }
}
