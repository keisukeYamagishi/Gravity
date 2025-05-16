//
//  Gravity.swift
//  sevens
//
//  Created by Shichimitoucarashi on 3/24/19.
//  Copyright © 2019 keisuke yamagishi. All rights reserved.
//

import UIKit

class Gravity {
    static func sequence(_ view: UIView, completion: (() -> Void)?) {
        Gravity()
            .sequence(view,
                      completion: completion)
    }

    private let distination: (CGFloat) -> CGFloat = {
        $0 / 180.0 * .pi
    }

    private var dynamicAnimator: UIDynamicAnimator!
    private var attachmentBehavior: UIAttachmentBehavior?
    private var gravityBehavior: UIGravityBehavior?

    func sequence(_ view: UIView, completion: (() -> Void)?) {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let squareCenterPoint = CGPoint(x: view.frame.maxX, y: view.frame.minY)
        let attachmentPoint = UIOffset(horizontal: view.frame.minX, vertical: view.frame.maxY)
        let attachmentBehavior = UIAttachmentBehavior(item: view, offsetFromCenter: attachmentPoint, attachedToAnchor: squareCenterPoint)
        dynamicAnimator.addBehavior(attachmentBehavior)

        let gravityBeahvior = UIGravityBehavior(items: [view])
        gravityBeahvior.magnitude = 4
        gravityBeahvior.angle = distination(100)
        dynamicAnimator.addBehavior(gravityBeahvior)
        gravityBehavior = gravityBeahvior

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            remove(view)
            completion?()
        }
    }

    func remove(_ view: UIView) {
        view.removeFromSuperview()
    }
}

extension UIView {
    func gravity(completion: (() -> Void)?) {
        Gravity
            .sequence(self,
                      completion: completion)
    }
}

extension CALayer {
    func boundAndFadeIn(completion: @escaping (() -> Void)) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion()
        }
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [fadeInAnimation()]
        add(groupAnimation, forKey: nil)
        CATransaction.commit()
    }

    func boundAnimation(from: CGFloat = 1.50) -> CASpringAnimation {
        let invalidAnimation = CASpringAnimation(keyPath: "transform.scale")
        invalidAnimation.fromValue = from
        invalidAnimation.toValue = 1.0
        invalidAnimation.initialVelocity = 30.0
        invalidAnimation.damping = 15.0
        invalidAnimation.stiffness = 120.0
        invalidAnimation.duration = invalidAnimation.settlingDuration
        return invalidAnimation
    }

    func fadeInAnimation() -> CABasicAnimation {
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 0.0
        fadeOut.toValue = 1.0
        fadeOut.duration = 0.3
        return fadeOut
    }
}
