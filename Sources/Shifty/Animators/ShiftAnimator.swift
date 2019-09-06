//
//  ShiftAnimator.swift
//  Shifty
//
//  Created by William McGinty on 8/31/19.
//  Copyright © 2019 Will McGinty. All rights reserved.
//

import Foundation

open class ShiftAnimator: NSObject {
    
    // MARK: Properties
    public let timingProvider: TimingProvider
    public let shiftAnimator: UIViewPropertyAnimator
    public private(set) var destinations: [Shift: Snapshot] = [:]
    
    // MARK: Initializers
    public init(timingProvider: TimingProvider) {
        self.timingProvider = timingProvider
        self.shiftAnimator = UIViewPropertyAnimator(duration: timingProvider.duration, timingParameters: timingProvider.parameters)
    }
 
    // MARK: Interface
    open func commit(_ shifts: [Shift]) {
        shifts.forEach { destinations[$0] = $0.destinationSnapshot() }
    }
    
    open func configureShiftAnimations(for shifts: [Shift], in container: UIView, completion: ((UIViewAnimatingPosition) -> Void)? = nil) {
        shifts.forEach { shift in
            let destination = destinations[shift]
            let replicant = shift.configuredReplicant(in: container)
            shift.layoutDestinationIfNeeded()
            
            shiftAnimator.addAnimations { [weak self] in
                self?.animations(for: shift, with: replicant, using: destination)
            }

            shiftAnimator.addCompletion { _ in
                shift.cleanup(replicant: replicant)
            }
        }
        
        completion.map(shiftAnimator.addCompletion)
    }
        
    open func animate(_ shifts: [Shift], in container: UIView, completion: ((UIViewAnimatingPosition) -> Void)? = nil) {
        configureShiftAnimations(for: shifts, in: container, completion: completion)
        startAnimation()
    }
}

// MARK: Helper
extension ShiftAnimator {
    
    func animations(for shift: Shift, with replicant: UIView, using destination: Snapshot?) {
        guard let keyframe = timingProvider.keyframe else {
            return shift.shift(for: replicant, using: destination)
        }
        
        UIView.animateKeyframes(withDuration: 0.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: keyframe.startTime, relativeDuration: keyframe.duration) {
                shift.shift(for: replicant, using: destination)
            }
        }, completion: nil)
    }
}
