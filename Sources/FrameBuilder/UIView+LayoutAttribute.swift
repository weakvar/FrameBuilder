//
//  UIView+LayoutAttribute.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

extension UIView {
    
    // MARK: - Public Methods
    
    /// This method takes an array of `LayoutAttribute` objects and applies each of them to the view's frame.
    /// - Parameter attributes: An array of `LayoutAttribute` objects.
    public func layout(_ attributes: [LayoutAttribute]) {
        var frame = self.frame
        
        for layoutAttribute in attributes {
            switch layoutAttribute {
            case .width(let value):
                applyWidth(value, to: &frame)
                
            case .height(let value):
                applyHeight(value, to: &frame)
                
            case .leading(let value):
                applyLeading(value, to: &frame)
                
            case .trailing(let value):
                applyTrailing(value, to: &frame)
                
            case .top(let value):
                applyTop(value, to: &frame)
                
            case .bottom(let value):
                applyBottom(value, to: &frame)
                
            case .leadingToLeading(ofView: let view, offset: let offset):
                applyLeadingToLeading(ofView: view, offset: offset, to: &frame)
                
            case .leadingToTrailing(ofView: let view, offset: let offset):
                applyLeadingToTrailing(ofView: view, offset: offset, to: &frame)
                
            case .trailingToLeading(ofView: let view, offset: let offset):
                applyTrailingToLeading(ofView: view, offset: offset, to: &frame)
                
            case .trailingToTrailing(ofView: let view, offset: let offset):
                applyTrailingToTrailing(ofView: view, offset: offset, to: &frame)
                
            case .topToTop(ofView: let view, offset: let offset):
                applyTopToTop(ofView: view, offset: offset, to: &frame)
                
            case .topToBottom(ofView: let view, offset: let offset):
                applyTopToBottom(ofView: view, offset: offset, to: &frame)
                
            case .bottomToTop(ofView: let view, offset: let offset):
                applyBottomToTop(ofView: view, offset: offset, to: &frame)
                
            case .bottomToBottom(ofView: let view, offset: let offset):
                applyBottomToBottom(ofView: view, offset: offset, to: &frame)
                
            case .centerXToCenterX(ofView: let view, offset: let offset):
                applyCenterXToCenterX(ofView: view, offset: offset, to: &frame)
                
            case .centerYToCenterY(ofView: let view, offset: let offset):
                applyCenterYToCenterY(ofView: view, offset: offset, to: &frame)
            }
        }
        
        self.frame = frame
    }
    
    // MARK: - Private Methods
    
    /// Updates the width of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new width value to set.
    ///   - frame: The frame to update with the new width value.
    private func applyWidth(_ value: CGFloat, to frame: inout CGRect) {
        frame.size.width = value
    }
    
    /// Updates the height of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new height value to set.
    ///   - frame: The frame to update with the new height value.
    private func applyHeight(_ value: CGFloat, to frame: inout CGRect) {
        frame.size.height = value
    }
    
    /// Updates the leading edge (minX) of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new leading edge value to set.
    ///   - frame: The frame to update with the new leading edge value.
    private func applyLeading(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.x = value
    }
    
    /// Updates the trailing edge (maxX) of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new trailing edge value to set.
    ///   - frame: The frame to update with the new trailing edge value.
    private func applyTrailing(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.x = value - frame.size.width
    }
    
    /// Updates the top edge (minY) of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new top edge value to set.
    ///   - frame: The frame to update with the new top edge value.
    private func applyTop(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.y = value
    }
    
    /// Updates the bottom edge (maxY) of the view's frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new bottom edge value to set.
    ///   - frame: The frame to update with the new bottom edge value.
    private func applyBottom(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.y = value - frame.size.height
    }
    
    /// Sets the view's leading edge to the leading edge of the given view with the specified offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset from the leading edge of the given view.
    ///   - frame: The frame to apply the changes to.
    private func applyLeadingToLeading(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.x = view.bounds.origin.x + offset
        } else {
            frame.origin.x = view.frame.origin.x + offset
        }
    }
    
    /// Sets the view's leading edge to the trailing edge of the given view with the specified offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset from the trailing edge of the given view.
    ///   - frame: The frame to apply the changes to.
    private func applyLeadingToTrailing(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.x = view.bounds.origin.x + view.bounds.size.width + offset
        } else {
            frame.origin.x = view.frame.origin.x + view.frame.size.width + offset
        }
    }
    
    /// Sets the view's trailing edge to the leading edge of the given view with the specified offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset from the leading edge of the given view.
    ///   - frame: The frame to apply the changes to.
    private func applyTrailingToLeading(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.x = view.bounds.origin.x - frame.size.width - offset
        } else {
            frame.origin.x = view.frame.origin.x - frame.size.width - offset
        }
    }
    
    /// Sets the view's trailing edge to the trailing edge of the given view with the specified offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset from the trailing edge of the given view.
    ///   - frame: The frame to apply the changes to.
    private func applyTrailingToTrailing(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.x = view.bounds.origin.x + view.bounds.size.width - frame.size.width - offset
        } else {
            frame.origin.x = view.frame.origin.x + view.frame.size.width - frame.size.width - offset
        }
    }
    
    /// Sets the top of the view's frame to be aligned with the top of another view's frame, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The other view to align with.
    ///   - offset: An optional offset to apply after alignment.
    ///   - frame: The view's frame to modify.
    private func applyTopToTop(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.y = view.bounds.origin.y + offset
        } else {
            frame.origin.y = view.frame.origin.y + offset
        }
    }
    
    /// Sets the top of the view's frame to be aligned with the bottom of another view's frame, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The other view to align with.
    ///   - offset: An optional offset to apply after alignment.
    ///   - frame: The view's frame to modify.
    private func applyTopToBottom(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.y = view.bounds.origin.y + view.bounds.size.height + offset
        } else {
            frame.origin.y = view.frame.origin.y + view.frame.size.height + offset
        }
    }
    
    /// Sets the bottom of the view's frame to be aligned with the top of another view's frame, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The other view to align with.
    ///   - offset: An optional offset to apply after alignment.
    ///   - frame: The view's frame to modify.
    private func applyBottomToTop(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.y = view.bounds.origin.y - frame.size.height - offset
        } else {
            frame.origin.y = view.frame.origin.y - frame.size.height - offset
        }
    }
    
    
    /// Sets the bottom of the view's frame to be aligned with the bottom of another view's frame, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The other view to align with.
    ///   - offset: An optional offset to apply after alignment.
    ///   - frame: The view's frame to modify.
    private func applyBottomToBottom(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.y = view.bounds.origin.y + view.bounds.size.height - frame.size.height - offset
        } else {
            frame.origin.y = view.frame.origin.y + view.frame.size.height - frame.size.height - offset
        }
    }
    
    /// Sets the horizontal center of the frame to the horizontal center of a given view, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset to apply.
    ///   - frame: The frame to modify.
    private func applyCenterXToCenterX(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.x = view.bounds.origin.x + view.bounds.size.width / 2 + offset - frame.size.width / 2
        } else {
            frame.origin.x = view.frame.origin.x + view.frame.size.width / 2 + offset - frame.size.width / 2
        }
    }
    
    /// Sets the vertical center of the frame to the vertical center of a given view, with an optional offset.
    ///
    /// - Parameters:
    ///   - view: The view to align to.
    ///   - offset: The offset to apply.
    ///   - frame: The frame to modify.
    private func applyCenterYToCenterY(ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.origin.y = view.bounds.origin.y + view.bounds.size.height / 2 + offset - frame.size.height / 2
        } else {
            frame.origin.y = view.frame.origin.y + view.frame.size.height / 2 + offset - frame.size.height / 2
        }
    }
    
}