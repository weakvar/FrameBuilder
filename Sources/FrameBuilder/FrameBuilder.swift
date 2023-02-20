//
//  FrameBuilder.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

/**
 `FrameBuilder` constructs attributes for a `UIView` frame in a compact and easy-to-use way.
 It provides a fluent interface for constructing an array of `LayoutAttribute` objects, which can then be used to set the frame of a `UIView`.
 
 To use `FrameBuilder`, create a new instance of the class, and then call methods on it to add attributes to the layout.
 Finally, call the `build()` method to create an array of `LayoutAttribute` objects, and then pass
 that array to the `applyAttributesToFrame(_:)` method of a `UIView` to apply the layout.
 
 ```swift
 let fooView = UIView()
 fooView.applyAttributesToFrame(
     FrameBuilder()
         .width(72)
         .height(18)
         .topEqualTo(.top, ofView: contentView, offset: 16)
         .trailingEqualTo(.trailing, ofView: contentView, offset: 12)
         .build()
 )
 ```
 */
public class FrameBuilder {
    
    // MARK: - Properties
    
    /// An array of layout attributes that define the size and position of the view being built.
    private var attributes: [LayoutAttribute]
    
    // MARK: - Initializers
    
    public init(attributes: [LayoutAttribute] = []) {
        self.attributes = attributes
    }
    
    // MARK: - Build Methods
    
    /// Builds and returns the final array of layout attributes.
    public func build() -> [LayoutAttribute] {
        return attributes
    }
    
    // MARK: - Attribute Methods
    
    /// Sets the width of the view.
    ///
    /// - Parameter value: The width value to be set.
    /// - Returns: `FrameBuilder` instance with the `width` attribute.
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
    /// - Returns: `FrameBuilder` instance with the `widthRelativeTo` attribute.
    @discardableResult public func width(from leadingEdge: LayoutXAxis, ofView leadingView: UIView, withOffset leadingOffset: CGFloat = 0, to trailingEdge: LayoutXAxis, ofView trailingView: UIView, withOffset trailingOffset: CGFloat = 0) -> Self {
        attributes.append(.widthRelativeTo(leadingView: leadingView, leadingEdge: leadingEdge, leadingOffset: leadingOffset, trailingView: trailingView, trailingEdge: trailingEdge, trailingOffset: trailingOffset))
        return self
    }
    
    /// Sets the height of the view.
    ///
    /// - Parameter value: The height value to be set.
    /// - Returns: `FrameBuilder` instance with the `height` attribute.
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
    /// - Returns: `FrameBuilder` instance with the `heightRelativeTo` attribute.
    @discardableResult public func height(from topEdge: LayoutYAxis, ofView topView: UIView, withOffset topOffset: CGFloat = 0, to bottomEdge: LayoutYAxis, ofView bottomView: UIView, withOffset bottomOffset: CGFloat = 0) -> Self {
        attributes.append(.heightRelativeTo(topView: topView, topEdge: topEdge, topOffset: topOffset, bottomView: bottomView, bottomEdge: bottomEdge, bottomOffset: bottomOffset))
        return self
    }
    
    /// Sets the leading edge of the view.
    ///
    /// - Parameter value: The value to be set for the leading edge.
    /// - Returns: `FrameBuilder` instance with the `leading` attribute.
    @discardableResult public func leading(_ value: CGFloat) -> Self {
        attributes.append(.leading(value))
        return self
    }
    
    /// Sets the leading edge of the view equal to the given edge of another view.
    ///
    /// - Parameters:
    ///   - edge: The edge of the other view to set the leading edge equal to.
    ///   - view: The view to set the leading edge equal to.
    ///   - offset: The offset from the other view's edge to set the leading edge.
    /// - Returns: A `FrameBuilder` instance with the `leading` attribute.
    @discardableResult public func leading(equalTo edge: LayoutXAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.leadingEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the trailing edge of the view.
    ///
    /// - Parameter value: The value to be set for the trailing edge.
    /// - Returns: `FrameBuilder` instance with the `trailing` attribute.
    @discardableResult public func trailing(_ value: CGFloat) -> Self {
        attributes.append(.trailing(value))
        return self
    }
    
    /// Sets the trailing edge of the view equal to the given edge of another view.
    ///
    /// - Parameters:
    ///   - edge: The edge of the other view to set the trailing edge equal to.
    ///   - view: The view to set the trailing edge equal to.
    ///   - offset: The offset from the other view's edge to set the trailing edge.
    /// - Returns: A `FrameBuilder` instance with the `trailing` attribute.
    @discardableResult public func trailing(equalTo edge: LayoutXAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.trailingEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the top edge of the view.
    ///
    /// - Parameter value: The value to be set for the top edge.
    /// - Returns: `FrameBuilder` instance with the `top` attribute.
    @discardableResult public func top(_ value: CGFloat) -> Self {
        attributes.append(.top(value))
        return self
    }
    
    /// Sets the top edge of the view equal to the specified edge of the specified view with an offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to which the top edge will be set equal to. Can be `.top` or `.bottom`.
    ///   - view: The view whose edge will be used to set the top edge of the current view.
    ///   - offset: The offset to apply between the edges of the two views.
    /// - Returns: A `FrameBuilder` instance with the `topEqualTo` attribute.
    @discardableResult public func top(equalTo edge: LayoutYAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.topEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the bottom edge of the view.
    ///
    /// - Parameter value: The value to be set for the bottom edge.
    /// - Returns: `FrameBuilder` instance with the `bottom` attribute.
    @discardableResult public func bottom(_ value: CGFloat) -> Self {
        attributes.append(.bottom(value))
        return self
    }
    
    /// Sets the bottom edge of the view equal to the specified edge of the specified view with an offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to which the bottom edge will be set equal to. Can be `.top` or `.bottom`.
    ///   - view: The view whose edge will be used to set the bottom edge of the current view.
    ///   - offset: The offset to apply between the edges of the two views.
    /// - Returns: A `FrameBuilder` instance with the `bottomEqualTo` attribute.
    @discardableResult public func bottom(equalTo edge: LayoutYAxis, ofView view: UIView, withOffset offset: CGFloat = 0) -> Self {
        attributes.append(.bottomEqualTo(edge, ofView: view, offset: offset))
        return self
    }
    
    /// Sets the horizontal center of the view to the horizontal center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose horizontal center is to be used.
    ///   - offset: The offset to be added to the horizontal center of the other view.
    /// - Returns: `FrameBuilder` instance with the `centerXToCenterX` attribute.
    @discardableResult public func centerXToCenterX(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerXToCenterX(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the vertical center of the view to the vertical center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose vertical center is to be used.
    ///   - offset: The offset to be added to the vertical center of the other view.
    /// - Returns: `FrameBuilder` instance with the `centerYToCenterY` attribute.
    @discardableResult public func centerYToCenterY(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerYToCenterY(ofView: view, offset: offset))
        return self
    }
    
}
