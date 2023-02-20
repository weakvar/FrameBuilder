//
//  LayoutAttribute.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

/// `LayoutAttribute` is an enum that represents different layout attributes of a view,
/// such as its width, height, leading and trailing edges, top and bottom edges, and center X and Y positions.
/// Each case of the enum contains the information necessary to set a particular layout attribute for a view,
/// including values for the attribute itself as well as any related views, edges,
/// or offsets that are needed to determine the final value.
///
/// The `LayoutAttribute` enum is used in conjunction with the `FrameBuilder` class
/// to define and apply layout constraints to views.
public enum LayoutAttribute {
    
    /// An attribute that defines a specific width.
    case width(CGFloat)
    
    /// An attribute that defines the width of a view relative to the leading and trailing views.
    case widthRelativeTo(leadingView: UIView, leadingEdge: LayoutXAxis, leadingOffset: CGFloat, trailingView: UIView, trailingEdge: LayoutXAxis, trailingOffset: CGFloat)
    
    /// An attribute that defines the width of a view to be equal to the width of another view.
    case widthEqualTo(view: UIView)
    
    /// An attribute that defines a specific height.
    case height(CGFloat)
    
    /// An attribute that defines the height of a view relative to the top and bottom views.
    case heightRelativeTo(topView: UIView, topEdge: LayoutYAxis, topOffset: CGFloat, bottomView: UIView, bottomEdge: LayoutYAxis, bottomOffset: CGFloat)
    
    /// An attribute that defines the height of a view to be equal to the height of another view.
    case heightEqualTo(view: UIView)
    
    /// An attribute that defines a specific leading edge position.
    case leading(CGFloat)
    
    /// An attribute that defines the leading edge of a view to be equal to the leading or trailing edge of another view plus an offset value.
    case leadingEqualTo(_ edge: LayoutXAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines a specific trailing edge position.
    case trailing(CGFloat)
    
    /// An attribute that defines the trailing edge of a view to be equal to the leading or trailing edge of another view plus an offset value.
    case trailingEqualTo(_ edge: LayoutXAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines a specific top edge position.
    case top(CGFloat)
    
    /// An attribute that defines the top edge of a view to be equal to the top or bottom edge of another view plus an offset value.
    case topEqualTo(_ edge: LayoutYAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines a specific bottom edge position.
    case bottom(CGFloat)
    
    /// An attribute that defines the bottom edge of a view to be equal to the top or bottom edge of another view plus an offset value.
    case bottomEqualTo(_ edge: LayoutYAxis, ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the center X of a view to be equal to the center X of another view plus an offset value.
    case centerXToCenterX(ofView: UIView, offset: CGFloat)
    
    /// An attribute that defines the center Y of a view to be equal to the center Y of another view plus an offset value.
    case centerYToCenterY(ofView: UIView, offset: CGFloat)
    
}

