//
//  UIView+.swift
//  CravityAlert
//
//  Created by keisuke yamagishi on 2025/05/16.
//

import UIKit

extension UIView {
    /// 特定の場所にborderをつける
    ///
    /// - Parameters:
    ///   - width: 線の幅
    ///   - color: 線の色
    ///   - position: 上下左右どこにborderをつけるか
    func addBorder(width: CGFloat,
                   color: UIColor,
                   position: Border)
    {
        let border = CALayer()

        switch position {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        case .right:
            border.frame = CGRect(x: frame.width - width, y: 0, width: width, height: frame.height)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - width, width: frame.width, height: width)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        }
    }
}
