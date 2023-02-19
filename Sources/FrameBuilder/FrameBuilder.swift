//
//  FrameBuilder.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

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
    public func width(_ value: CGFloat) -> Self {
        attributes.append(.width(value))
        return self
    }
    
    /// Sets the height of the view.
    ///
    /// - Parameter value: The height value to be set.
    /// - Returns: `FrameBuilder` instance with the `height` attribute.
    public func height(_ value: CGFloat) -> Self {
        attributes.append(.height(value))
        return self
    }
    
    /// Sets the leading edge of the view.
    ///
    /// - Parameter value: The value to be set for the leading edge.
    /// - Returns: `FrameBuilder` instance with the `leading` attribute.
    public func leading(_ value: CGFloat) -> Self {
        attributes.append(.leading(value))
        return self
    }
    
    /// Sets the trailing edge of the view.
    ///
    /// - Parameter value: The value to be set for the trailing edge.
    /// - Returns: `FrameBuilder` instance with the `trailing` attribute.
    public func trailing(_ value: CGFloat) -> Self {
        attributes.append(.trailing(value))
        return self
    }
    
    /// Sets the top edge of the view.
    ///
    /// - Parameter value: The value to be set for the top edge.
    /// - Returns: `FrameBuilder` instance with the `top` attribute.
    public func top(_ value: CGFloat) -> Self {
        attributes.append(.top(value))
        return self
    }
    
    /// Sets the bottom edge of the view.
    ///
    /// - Parameter value: The value to be set for the bottom edge.
    /// - Returns: `FrameBuilder` instance with the `bottom` attribute.
    public func bottom(_ value: CGFloat) -> Self {
        attributes.append(.bottom(value))
        return self
    }
    
    /// Sets the leading edge of the view to the leading edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose leading edge is to be used.
    ///   - offset: The offset to be added to the leading edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `leadingToLeading` attribute.
    public func leadingToLeading(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.leadingToLeading(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the leading edge of the view to the trailing edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose trailing edge is to be used.
    ///   - offset: The offset to be added to the trailing edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `leadingToTrailing` attribute.
    public func leadingToTrailing(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.leadingToTrailing(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the trailing edge of the view to the leading edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose leading edge is to be used.
    ///   - offset: The offset to be added to the leading edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `trailingToLeading` attribute.
    public func trailingToLeading(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.trailingToLeading(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the trailing edge of the view to the trailing edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose trailing edge is to be used.
    ///   - offset: The offset to be added to the trailing edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `trailingToTrailing` attribute.
    public func trailingToTrailing(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.trailingToTrailing(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the top edge of the view to the top edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose top edge is to be used.
    ///   - offset: The offset to be added to the top edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `topToTop` attribute.
    public func topToTop(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.topToTop(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the top edge of the view to the bottom edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose bottom edge is to be used.
    ///   - offset: The offset to be added to the bottom edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `topToBottom` attribute.
    public func topToBottom(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.topToBottom(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the bottom edge of the view to the top edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose top edge is to be used.
    ///   - offset: The offset to be added to the top edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `bottomToTop` attribute.
    public func bottomToTop(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.bottomToTop(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the bottom edge of the view to the bottom edge of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose bottom edge is to be used.
    ///   - offset: The offset to be added to the bottom edge of the other view.
    /// - Returns: `FrameBuilder` instance with the `bottomToBottom` attribute.
    public func bottomToBottom(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.bottomToBottom(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the horizontal center of the view to the horizontal center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose horizontal center is to be used.
    ///   - offset: The offset to be added to the horizontal center of the other view.
    /// - Returns: `FrameBuilder` instance with the `centerXToCenterX` attribute.
    public func centerXToCenterX(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerXToCenterX(ofView: view, offset: offset))
        return self
    }
    
    /// Sets the vertical center of the view to the vertical center of another view with an offset.
    ///
    /// - Parameters:
    ///   - view: The other view whose vertical center is to be used.
    ///   - offset: The offset to be added to the vertical center of the other view.
    /// - Returns: `FrameBuilder` instance with the `centerYToCenterY` attribute.
    public func centerYToCenterY(ofView view: UIView, offset: CGFloat = 0) -> Self {
        attributes.append(.centerYToCenterY(ofView: view, offset: offset))
        return self
    }
    
}
