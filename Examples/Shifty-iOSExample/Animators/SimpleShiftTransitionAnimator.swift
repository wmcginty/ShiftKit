//
//  SimpleShiftAnimator.swift
//  Shifty
//
//  Created by William McGinty on 7/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Shifty

/** A transition with the implicit contract that the source will animate all of it's contents off screen to a point where it's visual
 state matches that of the destination. The destination will then be instantaneously swapped on screen and be given the chance to
 complete any entrance animations to reach it's final visual state. **/
class SimpleShiftTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        /** Begin by ensuring the transitionContext is configured correctly, and that our source + destination can power the transition.
         This being a basic example - exit if this fails, no fallbacks. YMMV with more complicated examples. */
        let container = transitionContext.containerView
        guard let sourceController = transitionContext.viewController(forKey: .from), let destinationController = transitionContext.viewController(forKey: .to) else { return }
        guard let destinationView = transitionContext.view(forKey: .to) else { return }
        guard let source = sourceController as? ShiftTransitionable, let destination = destinationController as? ShiftTransitionable else { return }
        
        container.addSubview(destinationView)
        destinationView.frame = transitionContext.finalFrame(for: destinationController)
        destinationView.layoutIfNeeded()
        
        let context = SpringAnimationContext(timingParameters: UISpringTimingParameters(dampingRatio: 0.8))
        let coordinator = DefaultCoordinator(animationContext: context)
        
        let shiftAnimator = ShiftAnimator(source: source, destination: destination, coordinator: coordinator)! //In this example, we're confident that both the source and destination have an available Shift.
        shiftAnimator.animate(withDuration: transitionDuration(using: transitionContext), inContainer: container) { position in
            transitionContext.completeTransition(position == .end)
        }

        
        let sourceAnimator = ActionAnimator(transitionable: source)
        sourceAnimator.animate(withDuration: transitionDuration(using: transitionContext), inContainer: container)
        
        let destinationAnimator = ActionAnimator(transitionable: destination, isInverted: true)
        destinationAnimator.animate(withDuration: transitionDuration(using: transitionContext), inContainer: container)
    }
}
