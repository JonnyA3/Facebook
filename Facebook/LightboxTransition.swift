//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Abowd, Jonathan on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: duration, animations: {
            
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        fromViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        
        UIView.animate(withDuration: duration, animations: {
            
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
}
