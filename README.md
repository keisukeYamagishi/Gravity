# Gravity

[![](https://img.shields.io/badge/lang-Swift-fc3158)](https://swift.org/)

## OverView



## Use it

|CI|build|
|:----|:----|
|github actions||

***Via SSH***: For those who plan on regularly making direct commits, cloning over SSH may provide a better experience (which requires uploading SSH keys to GitHub):

```
$ git clone git@github.com:keisukeYamagishi/Gravity.git
```
***Via https***: For those checking out sources as read-only, HTTPS works best:

```
$ git clone https://github.com/keisukeYamagishi/Gravity.git
```

## Usage Gravity Animation

The implementation of the gravity animation relies on the source code and files enumerated below.
Detailed instructions concerning its usage are delineated in the section that follows.

```Swift
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
```

Use this gravity animation

```Swift
    view
        .gravity {
            print("Completion animation")
        }
```
