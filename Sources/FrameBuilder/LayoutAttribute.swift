//
//  LayoutAttribute.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

public enum LayoutAttribute {
    case width(CGFloat)
    case height(CGFloat)
    case leading(CGFloat)
    case trailing(CGFloat)
    case top(CGFloat)
    case bottom(CGFloat)
    case leadingToLeading(ofView: UIView, offset: CGFloat)
    case leadingToTrailing(ofView: UIView, offset: CGFloat)
    case trailingToLeading(ofView: UIView, offset: CGFloat)
    case trailingToTrailing(ofView: UIView, offset: CGFloat)
    case topToTop(ofView: UIView, offset: CGFloat)
    case topToBottom(ofView: UIView, offset: CGFloat)
    case bottomToTop(ofView: UIView, offset: CGFloat)
    case bottomToBottom(ofView: UIView, offset: CGFloat)
    case centerXToCenterX(ofView: UIView, offset: CGFloat)
    case centerYToCenterY(ofView: UIView, offset: CGFloat)
}
