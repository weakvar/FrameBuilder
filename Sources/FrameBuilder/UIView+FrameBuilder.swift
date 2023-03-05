//
//  UIView+FrameBuilder.swift
//  
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

extension UIView {
    
    // MARK: - Private Properties
    
    private var layoutDirection: UIUserInterfaceLayoutDirection {
        return UIApplication.shared.userInterfaceLayoutDirection
    }
    
    // MARK: - Public Methods
    
    /// This function applies the attributes defined in a `FrameBuilder` object to the view's frame.
    /// It iterates through each attribute in the `FrameBuilder` and applies the corresponding method to modify the view's frame accordingly.
    /// Once all attributes have been applied, the updated frame is set as the view's new frame.
    ///
    /// - Parameter builder: The `FrameBuilder` object containing the attributes to be applied to the view's frame.
    public func buildFrame(_ builder: FrameBuilder) {
        var frame = self.frame
        
        for attribute in builder.attributes {
            switch attribute {
            case .width(let value):
                applyWidth(value, to: &frame)
                
            case .widthRelativeTo(let leadingView, let leadingEdge, let leadingOffset, let trailingView, let trailingEdge, let trailingOffset):
                applyWidthRelativeTo(leadingView: leadingView, leadingEdge: leadingEdge, leadingOffset: leadingOffset, trailingView: trailingView, trailingEdge: trailingEdge, trailingOffset: trailingOffset, to: &frame)
                
            case .widthEqualTo(view: let view):
                applyWidthEqualTo(view: view, to: &frame)
                
            case .height(let value):
                applyHeight(value, to: &frame)
                
            case .heightRelativeTo(topView: let topView, topEdge: let topEdge, topOffset: let topOffset, bottomView: let bottomView, bottomEdge: let bottomEdge, bottomOffset: let bottomOffset):
                applyHeightRelativeTo(topView: topView, topEdge: topEdge, topOffset: topOffset, bottomView: bottomView, bottomEdge: bottomEdge, bottomOffset: bottomOffset, to: &frame)
                
            case .heightEqualTo(view: let view):
                applyHeightEqualTo(view: view, to: &frame)
                
            case .x(let value):
                applyX(value, to: &frame)
                
            case .y(let value):
                applyY(value, to: &frame)
                
            case .leadingEqualTo(let edge, ofView: let view, offset: let offset):
                applyLeadingEqualTo(edge: edge, ofView: view, offset: offset, to: &frame)
                
            case .trailingEqualTo(let edge, ofView: let view, offset: let offset):
                applyTrailingEqualTo(edge: edge, ofView: view, offset: offset, to: &frame)
                
            case .topEqualTo(let edge, ofView: let view, offset: let offset):
                applyTopEqualTo(edge: edge, ofView: view, offset: offset, to: &frame)
                
            case .bottomEqualTo(let edge, ofView: let view, offset: let offset):
                applyBottomEqualTo(edge: edge, ofView: view, offset: offset, to: &frame)
                
            case .centerXToCenterX(ofView: let view, offset: let offset):
                applyCenterXToCenterX(ofView: view, offset: offset, to: &frame)
                
            case .centerYToCenterY(ofView: let view, offset: let offset):
                applyCenterYToCenterY(ofView: view, offset: offset, to: &frame)
            }
        }
        
        self.frame = frame
    }
    
    // MARK: - Private Methods
    
    /// Updates the width of the frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new width value to set.
    ///   - frame: The frame to update with the new width value.
    private func applyWidth(_ value: CGFloat, to frame: inout CGRect) {
        frame.size.width = value
    }
    
    /// Updates the width of the frame to be relative to the specified leading and trailing views and their edges.
    ///
    /// - Parameters:
    ///   - leadingView: The leading `UIView` to calculate the width from.
    ///   - leadingEdge: The edge of the leading view to use for calculating the width.
    ///   - leadingOffset: The offset from the leading edge of the leading view to use for calculating the width.
    ///   - trailingView: The trailing `UIView` to calculate the width from.
    ///   - trailingEdge: The edge of the trailing view to use for calculating the width.
    ///   - trailingOffset: The offset from the trailing edge of the trailing view to use for calculating the width.
    ///   - frame: The frame to update with the new width value.
    private func applyWidthRelativeTo(leadingView: UIView, leadingEdge: FrameXAxis, leadingOffset: CGFloat, trailingView: UIView, trailingEdge: FrameXAxis, trailingOffset: CGFloat, to frame: inout CGRect) {
        var leadingX:  CGFloat = 0
        var trailingX: CGFloat = 0
        
        // Calculate the X position from the leading UIView:
        // 1. Check if the current UIView is a subview of `leadingView`.
        // 2. Set the leading X position based on the layout direction.
        if self.isDescendant(of: leadingView) {
            if layoutDirection == .rightToLeft {
                leadingX = leadingEdge == .leading
                    ? leadingView.bounds.maxX - leadingOffset
                    : leadingView.bounds.minX - leadingOffset
            } else {
                leadingX = leadingEdge == .leading
                    ? leadingView.bounds.minX + leadingOffset
                    : leadingView.bounds.maxX + leadingOffset
            }
        } else {
            if layoutDirection == .rightToLeft {
                leadingX = leadingEdge == .leading
                    ? leadingView.frame.maxX - leadingOffset
                    : leadingView.frame.minX - leadingOffset
            } else {
                leadingX = leadingEdge == .leading
                    ? leadingView.frame.minX + leadingOffset
                    : leadingView.frame.maxX + leadingOffset
            }
        }
        
        // Calculate the X position from the trailing UIView:
        // 1. Check if the current UIView is a subview of `trailingView`.
        // 2. Set the trailing X position based on the layout direction.
        if self.isDescendant(of: trailingView) {
            if layoutDirection == .rightToLeft {
                trailingX = trailingEdge == .leading
                    ? trailingView.bounds.maxX + trailingOffset
                    : trailingView.bounds.minX + trailingOffset
            } else {
                trailingX = trailingEdge == .leading
                    ? trailingView.bounds.minX - trailingOffset
                    : trailingView.bounds.maxX - trailingOffset
            }
        } else {
            if layoutDirection == .rightToLeft {
                trailingX = trailingEdge == .leading
                    ? trailingView.frame.maxX + trailingOffset
                    : trailingView.frame.minX + trailingOffset
            } else {
                trailingX = trailingEdge == .leading
                    ? trailingView.frame.minX - trailingOffset
                    : trailingView.frame.maxX - trailingOffset
            }
        }
        
        frame.size.width = layoutDirection == .rightToLeft
            ? leadingX - trailingX
            : trailingX - leadingX
    }
    
    /// Updates the width of the frame to be equal to the width of the specified view.
    ///
    /// - Parameters:
    ///   - view: The `UIView` whose width is to be used for updating the view's width.
    ///   - frame: The frame to update with the new width value.
    private func applyWidthEqualTo(view: UIView, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.size.width = view.bounds.size.width
        } else {
            frame.size.width = view.frame.size.width
        }
    }
    
    /// Updates the height of the frame to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new height value to set.
    ///   - frame: The frame to update with the new height value.
    private func applyHeight(_ value: CGFloat, to frame: inout CGRect) {
        frame.size.height = value
    }
    
    /// Updates the height of the frame to be relative to the specified top and bottom views and their edges.
    ///
    /// - Parameters:
    ///   - topView: The top `UIView` to calculate the height from.
    ///   - topEdge: The edge of the top view to use for calculating the height.
    ///   - topOffset: The offset from the top edge of the top view to use for calculating the height.
    ///   - bottomView: The bottom `UIView` to calculate the height from.
    ///   - bottomEdge: The edge of the bottom view to use for calculating the height.
    ///   - bottomOffset: The offset from the bottom edge of the bottom view to use for calculating the height.
    ///   - frame: The frame to update with the new height value.
    private func applyHeightRelativeTo(topView: UIView, topEdge: FrameYAxis, topOffset: CGFloat, bottomView: UIView, bottomEdge: FrameYAxis, bottomOffset: CGFloat, to frame: inout CGRect) {
        var topY: CGFloat = 0
        var bottomY: CGFloat = 0
        
        if self.isDescendant(of: topView) {
            topY = topEdge == .top
                ? topView.bounds.minY + topOffset
                : topView.bounds.maxY + topOffset
        } else {
            topY = topEdge == .top
                ? topView.frame.minY + topOffset
                : topView.frame.maxY + topOffset
        }
        
        if self.isDescendant(of: bottomView) {
            bottomY = bottomEdge == .top
                ? bottomView.bounds.minY - bottomOffset
                : bottomView.bounds.maxY - bottomOffset
        } else {
            bottomY = bottomEdge == .top
                ? bottomView.frame.minY - bottomOffset
                : bottomView.frame.maxY - bottomOffset
        }
        
        frame.size.height = bottomY - topY
    }
    
    /// Updates the height of the frame to be equal to the height of the specified view.
    ///
    /// - Parameters:
    ///   - view: The `UIView` whose height is to be used for updating the view's height.
    ///   - frame: The frame to update with the new width value.
    private func applyHeightEqualTo(view: UIView, to frame: inout CGRect) {
        if self.isDescendant(of: view) {
            frame.size.height = view.bounds.size.height
        } else {
            frame.size.height = view.frame.size.height
        }
    }
    
    /// Updates the x coordinate of the frame origin to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new x coordinate to set.
    ///   - frame: The frame to update with the new x coordinate.
    private func applyX(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.x = value
    }
    
    /// Updates the y coordinate of the frame origin to the specified value.
    ///
    /// - Parameters:
    ///   - value: The new y coordinate to set.
    ///   - frame: The frame to update with the new y coordinate.
    private func applyY(_ value: CGFloat, to frame: inout CGRect) {
        frame.origin.y = value
    }
    
    /// Updates the leading edge of the frame to be equal to the specified edge of the specified view, with the given offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to update to be equal to the specified view's edge.
    ///   - view: The view to calculate the edge value from.
    ///   - offset: The offset from the specified edge of the specified view to use for calculating the edge value.
    ///   - frame: The frame to update with the new leading edge value.
    private func applyLeadingEqualTo(edge: FrameXAxis, ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if layoutDirection == .rightToLeft {
            switch edge {
            case .leading:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.maxX - frame.size.width - offset
                } else {
                    frame.origin.x = view.frame.maxX - frame.size.width - offset
                }
            case .trailing:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.minX - frame.size.width - offset
                } else {
                    frame.origin.x = view.frame.minX - frame.size.width - offset
                }
            }
        } else {
            switch edge {
            case .leading:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.minX + offset
                } else {
                    frame.origin.x = view.frame.minX + offset
                }
            case .trailing:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.maxX + offset
                } else {
                    frame.origin.x = view.frame.maxX + offset
                }
            }
        }
    }
    
    /// Updates the trailing edge of the frame to be equal to the specified edge of the specified view, with the given offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to update to be equal to the specified view's edge.
    ///   - view: The view to calculate the edge value from.
    ///   - offset: The offset from the specified edge of the specified view to use for calculating the edge value.
    ///   - frame: The frame to update with the new trailing edge value.
    private func applyTrailingEqualTo(edge: FrameXAxis, ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        if layoutDirection == .rightToLeft {
            switch edge {
            case .leading:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.maxX + offset
                } else {
                    frame.origin.x = view.frame.maxX + offset
                }
            case .trailing:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.minX + offset
                } else {
                    frame.origin.x = view.frame.minX + offset
                }
            }
        } else {
            switch edge {
            case .leading:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.minX - frame.size.width - offset
                } else {
                    frame.origin.x = view.frame.minX - frame.size.width - offset
                }
            case .trailing:
                if self.isDescendant(of: view) {
                    frame.origin.x = view.bounds.maxX - frame.size.width - offset
                } else {
                    frame.origin.x = view.frame.maxX - frame.size.width - offset
                }
            }
        }
    }
    
    /// Updates the top edge of the frame to be equal to the specified edge of the specified view, with the given offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to update to be equal to the specified view's edge.
    ///   - view: The view to calculate the edge value from.
    ///   - offset: The offset from the specified edge of the specified view to use for calculating the edge value.
    ///   - frame: The frame to update with the new top edge value.
    private func applyTopEqualTo(edge: FrameYAxis, ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        switch edge {
        case .top:
            if self.isDescendant(of: view) {
                frame.origin.y = view.bounds.minY + offset
            } else {
                frame.origin.y = view.frame.minY + offset
            }
        case .bottom:
            if self.isDescendant(of: view) {
                frame.origin.y = view.bounds.maxY + offset
            } else {
                frame.origin.y = view.frame.maxY + offset
            }
        }
    }
    
    /// Updates the bottom edge of the frame to be equal to the specified edge of the specified view, with the given offset.
    ///
    /// - Parameters:
    ///   - edge: The edge of the view to update to be equal to the specified view's edge.
    ///   - view: The view to calculate the edge value from.
    ///   - offset: The offset from the specified edge of the specified view to use for calculating the edge value.
    ///   - frame: The frame to update with the new top edge value.
    private func applyBottomEqualTo(edge: FrameYAxis, ofView view: UIView, offset: CGFloat, to frame: inout CGRect) {
        switch edge {
        case .top:
            if self.isDescendant(of: view) {
                frame.origin.y = view.bounds.minY - frame.size.height - offset
            } else {
                frame.origin.y = view.frame.minY - frame.size.height - offset
            }
        case .bottom:
            if self.isDescendant(of: view) {
                frame.origin.y = view.bounds.maxY - frame.size.height - offset
            } else {
                frame.origin.y = view.frame.maxY - frame.size.height - offset
            }
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
            frame.origin.x = view.bounds.midX - (frame.size.width / 2) + offset
        } else {
            frame.origin.x = view.frame.midX - (frame.size.width / 2) + offset
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
            frame.origin.y = view.bounds.midY - (frame.size.height / 2) + offset
        } else {
            frame.origin.y = view.frame.midY - (frame.size.height / 2) + offset
        }
    }
    
}
