//
//  FrameBuilder.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

/**
 The `FrameBuilder` class provides a simple and intuitive way to create and modify frames for `UIView` objects.
 It allows you to set various attributes such as width, height, leading, trailing, top, bottom, etc. You can also set attributes relative to other views.
 The class uses a fluent API, which means that you can chain multiple attribute setters together to create complex frames.
 
 To use `FrameBuilder`, create a new instance of the class, and then use its methods
 to specify the desired frame attributes of your view.
 
 ```swift
 let fooView = UIView()
 fooView.buildFrame(
     FrameBuilder()
         .width(48)
         .height(48)
         .leading(equalTo: .leading, ofView: barView, withOffset: 12)
         .centerYToCenterY(ofView: barView)
 )
 ```
 */
public final class FrameBuilder {
    
    // MARK: - Properties
    
    /// An array of `FrameAttribute` objects that are used to define the frame of a view.
    private(set) var attributes = [FrameAttribute]()
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Attribute Methods
    
    /// Sets the width of the view.
    ///
    /// - Parameter value: The width value to be set.
    /// - Returns: A `FrameBuilder` instance with the `width` attribute.
    @discardableResult public func width(_ value: CGFloat) -> Self {
        attributes.append(.width(value))
        return self
    }
    
    /// Sets the width of the view relative to the leading and trailing edges of the specified views.
    ///
    /// - Parameters:
    ///   - leadingView: The view to use for the leading edge of the width.
    ///   - leadingEdge: The edge of the leading view to use for the leading edge of the width.
    ///   - leadingOffset: The offset from the leading edge of the leading view.
    ///   - trailingView: The view to use for the trailing edge of the width.
    ///   - trailingEdge: The edge of the trailing view to use for the trailing edge of the width.
    ///   - trailingOffset: The offset from the trailing edge of the trailing view.
    /// - Returns: A `FrameBuilder` instance with the `widthRelativeTo` attribute.
    @discardableResult public func width(from leadingEdge: FrameXAxis, ofView leadingView: UIView, withOffset leadingOffset: CGFloat = 0, to trailingEdge: FrameXAxis, ofView trailingView: UIView, withOffset trailingOffset: CGFloat = 0) -> Self {
        attributes.append(.widthRelativeTo(leadingView: leadingView, leadingEdge: leadingEdge, leadingOffset: leadingOffset, trailingView: trailingView, trailingEdge: trailingEdge, trailingOffset: trailingOffset))
        return self
    }
    
    /// Sets the width of the view to be equal to the width of the specified view
    ///
    /// - Parameter view: The `UIView` whose width is to be used for setting the view's width.
    /// - Returns: A `FrameBuilder` instance with the `widthEqualTo` attribute.
    @discardableResult public func width(equalTo view: UIView) -> Self {
        attributes.append(.widthEqualTo(view: view))
        return self
    }
    
    /// Sets the height of the view.
    ///
    /// - Parameter value: The height value to be set.
    /// - Returns: A `FrameBuilder` instance with the `height` attribute.
    @discardableResult public func height(_ value: CGFloat) -> Self {
        attributes.append(.height(value))
        return self
    }
    
    /// Sets the height of the view relative to the specified top and bottom views and their edges.
    ///
    /// - Parameters:
    ///   - topView: The top `UIView` to calculate the height from.
    ///   - topEdge: The edge of the top view to use for calculating the height.
    ///   - topOffset: The offset from the top edge of the top view to use for calculating the height.
    ///   - bottomView: The bottom `UIView` to calculate the height from.
    ///   - bottomEdge: The edge of the bottom view to use for calculating the height.
    ///   - bottomOffset: The offset from the bottom edge of the bottom view to use for calculating the height.
    /// - Returns: A `FrameBuilder` instance with the `heightRelativeTo` attribute.
    @discardableResult public func height(from topEdge: FrameYAxis, ofView topView: UIView, withOffset topOffset: CGFloat = 0, to bottomEdge: FrameYAxis, ofView bottomView: UIView, withOffset bottomOffset: CGFloat = 0) -> Self {
        attributes.append(.heightRelativeTo(topView: topView, topEdge: topEdge, topOffset: topOffset, bottomView: bottomView, bottomEdge: bottomEdge, bottomOffset: bottomOffset))
        return self
    }
    
    /// Sets the height of the view to be equal to the height of the specified view
    ///
    /// - Parameter view: The `UIView` whose height is to be used for setting the view's height.
    /// - Returns: A `FrameBuilder` instance with the `heightEqualTo` attribute.
    @discardableResult public func height(equalTo view: UIView) -> Self {
        attributes.append(.heightEqualTo(view: view))
        return self
    }
    
    /// Sets the x position of the view.
    ///
    /// - Parameter value: The value to be set for the x position.
    /// - Returns: A `FrameBuilder` instance with the `x` attribute.
    @discardableResult public func x(_ value: CGFloat) -> Self {
        attributes.append(.x(value))
        return self
    }
    
    /// Sets the y position of the view.
    ///
    /// - Parameter value: The value to be set for the y position.
    /// - Returns: A `FrameBuilder` instance with the `y` attribute.
    @discardableResult public func y(_ value: CGFloat) -> Self {
        attributes.append(.y(value))
        return self
    }
    
    /// Sets the leading edge of the view equal to the given edge of another view.
    ///
    /// - Parameters:
    ///   - edge: The edge of the other view to set the leading edge equal to.
    ///   - view: The view to set the leading edge equal to.
    ///   - offset: The offset from the other view's edge to set the leading edge.
    /// - Returns: A `FrameBuilder` instance with the `leading` attribute.
    @discardableResult public func leading(equalTo edge: FrameXAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.leadingEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the trailing edge of the view equal to the given edge of another view.
    ///
    /// - Parameters:
    ///   - edge: The edge of the other view to set the trailing edge equal to.
    ///   - view: The view to set the trailing edge equal to.
    ///   - offset: The offset from the other view's edge to set the trailing edge.
    /// - Returns: A `FrameBuilder` instance with the `trailing` attribute.
    @discardableResult public func trailing(equalTo edge: FrameXAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.trailingEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the top edge of the view equal to the specified edge of the specified view with an offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to which the top edge will be set equal to. Can be `.top` or `.bottom`.
    ///   - view: The view whose edge will be used to set the top edge of the current view.
    ///   - offset: The offset to apply between the edges of the two views.
    /// - Returns: A `FrameBuilder` instance with the `topEqualTo` attribute.
    @discardableResult public func top(equalTo edge: FrameYAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.topEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the bottom edge of the view equal to the specified edge of the specified view with an offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to which the bottom edge will be set equal to. Can be `.top` or `.bottom`.
    ///   - view: The view whose edge will be used to set the bottom edge of the current view.
    ///   - offset: The offset to apply between the edges of the two views.
    /// - Returns: A `FrameBuilder` instance with the `bottomEqualTo` attribute.
    @discardableResult public func bottom(equalTo edge: FrameYAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.bottomEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the horizontal center of the view to the horizontal center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose horizontal center is to be used.
    ///   - offset: The offset to be added to the horizontal center of the other view.
    /// - Returns: A `FrameBuilder` instance with the `centerXToCenterX` attribute.
    @discardableResult public func centerXToCenterX(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerXToCenterX(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the vertical center of the view to the vertical center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose vertical center is to be used.
    ///   - offset: The offset to be added to the vertical center of the other view.
    /// - Returns: A `FrameBuilder` instance with the `centerYToCenterY` attribute.
    @discardableResult public func centerYToCenterY(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerYToCenterY(ofView: view, offset: offset))
        return self
    }
    
}
