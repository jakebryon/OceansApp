//
//  UIView.swift
//  Wer
//
//  Created by Jacob Bryon on 11/19/16.
//  Copyright © 2016 Jacob Bryon. All rights reserved.
//

import UIKit

private var errorAssociationKey: UInt8 = 0

extension UIView {
    
    @nonobjc static let animationTime = 0.3
    
    func setX(x: CGFloat) {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func setY(y: CGFloat) {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func setWidth(width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func setHeight(height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        var frame = self.frame
        frame.size = CGSize(width: width, height: height)
        self.frame = frame
    }
    
    func moveX(x: CGFloat) {
        var frame = self.frame
        frame.origin.x += x
        self.frame = frame
    }
    
    func moveY(y: CGFloat) {
        var frame = self.frame
        frame.origin.y += y
        self.frame = frame
    }
    
    func increaseWidth(increase: CGFloat) {
        var frame = self.frame
        frame.size.width += increase
        self.frame = frame
    }
    
    func increaseHeight(increase: CGFloat) {
        var frame = self.frame
        frame.size.height += increase
        self.frame = frame
    }
    
    func setSize(size: CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    
    func alignRightWithMargin(margin: CGFloat) {
        if (self.superview != nil) {
            var frame = self.frame
            frame.origin.x = self.superview!.frame.width - self.frame.width - margin
            self.frame = frame
        }
    }
    
    func alignBottomWithMargin(margin: CGFloat) {
        if (self.superview != nil) {
            var frame = self.frame
            frame.origin.y = self.superview!.frame.height - self.frame.height - margin
            self.frame = frame
        }
    }
    
    // Fill the view's width to its superview from it's current x origin
    func fillWidth() {
        if (self.superview != nil) {
            var frame = self.frame;
            frame.size.width = self.superview!.frame.width - self.frame.minX
            self.frame = frame
        }
    }
    
    func fillWidthWithMargin(margin: CGFloat) {
        if (self.superview != nil) {
            self.fillWidth()
            self.setWidth(width: self.frame.width - margin)
        }
    }
    
    // Fill the view's height to its superview from it's current y origin
    func fillHeight() {
        if (self.superview != nil) {
            var frame = self.frame
            frame.size.height = self.superview!.frame.height - self.frame.minY
            self.frame = frame
        }
    }
    
    func fillHeightWithMargin(margin: CGFloat) {
        if (self.superview != nil) {
            self.fillHeight()
            self.setHeight(height: self.frame.height - margin)
        }
    }
    
    func centerHorizontally() {
        if (self.superview != nil) {
            self.setX(x: self.superview!.frame.width/2 - self.frame.width/2)
        }
    }
    
    func centerVertically() {
        if (self.superview != nil) {
            self.setY(y: self.superview!.frame.height/2 - self.frame.height/2)
        }
    }
    
    func centerInSuperview() {
        self.centerHorizontally()
        self.centerVertically()
    }
}
