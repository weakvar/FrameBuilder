//
//  FrameAttribute.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

/// The `FrameAttribute` defines a set of attributes to be applied to a view’s frame.
/// Each attribute represents a specific property of the view’s frame, such as width, height, or position.
public enum FrameAttribute {
    
    /// An attribute that defines a specific width.
    case width(CGFloat)
    
    /// An attribute that defines the width of a view relative to the leading and trailing views.
    case widthRelativeTo(leadingView: UIView, leadingEdge: FrameXAxis, leadingOffset: CGFloat, trailingView: UIView, trailingEdge: FrameXAxis, trailingOffset: CGFloat)
    
    /// An attribute that defines the width of a view to be equal to the width of another view.
    case widthEqualTo(view: UIView)
    
    /// An attribute that defines a specific height.
    case height(CGFloat)
    
    /// An attribute that defines the height of a view relative to the top and bottom views.
    case heightRelativeTo(topView: UIView, topEdge: FrameYAxis, topOffset: CGFloat, bottomView: UIView, bottomEdge: FrameYAxis, bottomOffset: CGFloat)
    
    /// An attribute that defines the height of a view to be equal to the height of another view.
    case heightEqualTo(view: UIView)
    
    /// An attribute that defines a specific position along the x-axis.
    case x(CGFloat)
    
    /// An attribute that defines a specific position along the y-axis.
    case y(CGFloat)
    
    /// An attribute that defines the leading edge of a view to be equal to the leading or trailing edge of another view plus an offset value.
    case leadingEqualTo(_ edge: FrameXAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the trailing edge of a view to be equal to the leading or trailing edge of another view plus an offset value.
    case trailingEqualTo(_ edge: FrameXAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the top edge of a view to be equal to the top or bottom edge of another view plus an offset value.
    case topEqualTo(_ edge: FrameYAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the bottom edge of a view to be equal to the top or bottom edge of another view plus an offset value.
    case bottomEqualTo(_ edge: FrameYAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the center X of a view to be equal to the center X of another view plus an offset value.
    case centerXToCenterX(ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the center Y of a view to be equal to the center Y of another view plus an offset value.
    case centerYToCenterY(ofView: UIView, offset: CGFloat)
    
}

