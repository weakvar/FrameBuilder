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
    case widthRelativeTo(leadingView: UIView, leadingEdge: LayoutXAxis, leadingOffset: CGFloat, trailingView: UIView, trailingEdge: LayoutXAxis, trailingOffset: CGFloat)
    case heightRelativeTo(topView: UIView, topEdge: LayoutYAxis, topOffset: CGFloat, bottomView: UIView, bottomEdge: LayoutYAxis, bottomOffset: CGFloat)
    case leading(CGFloat)
    case trailing(CGFloat)
    case top(CGFloat)
    case bottom(CGFloat)
    case leadingEqualTo(_ edge: LayoutXAxis, ofView: UIView, offset: CGFloat)
    case trailingEqualTo(_ edge: LayoutXAxis, ofView: UIView, offset: CGFloat)
    case topEqualTo(_ edge: LayoutYAxis, ofView: UIView, offset: CGFloat)
    case bottomEqualTo(_ edge: LayoutYAxis, ofView: UIView, offset: CGFloat)
    case centerXToCenterX(ofView: UIView, offset: CGFloat)
    case centerYToCenterY(ofView: UIView, offset: CGFloat)
}
