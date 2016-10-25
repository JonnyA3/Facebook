//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Abowd, Jonathan on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    var blackView: UIView!
    var imageView: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
//        //start 'add view' code
//        let tabViewController = fromViewController as! UITabBarController
//        let navigationController = tabViewController.selectedViewController as! UINavigationController
//        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
//        let photoViewController = toViewController as! PhotoViewController
//
//        newsFeedViewController.selectedImageView.isHidden = true
//        photoViewController.imageView.isHidden = true
//
//        imageView = UIImageView()
//        imageView.image = newsFeedViewController.selectedImageView.image
//        imageView.frame = newsFeedViewController.selectedImageView.frame
//        imageView.contentMode = newsFeedViewController.selectedImageView.contentMode
//        
//        containerView.addSubview(imageView)
//        //stop 'add view' code

        
        //start 'add view' code
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        newsFeedViewController.selectedImageView.isHidden = true
        photoViewController.imageView.isHidden = true
        
        imageView = UIImageView()
        imageView.image = newsFeedViewController.selectedImageView.image
        let frame = containerView.convert(newsFeedViewController.selectedImageView.frame, from: newsFeedViewController.selectedImageView.superview)
        imageView.frame = frame
        imageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        imageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds
        
        containerView.addSubview(imageView)
        //stop 'add view' code
        
        
        blackView = UIView()
        blackView.frame = CGRect(x: 0, y: 0, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        
        toViewController.view.alpha = 0

//        toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0)
        fromViewController.view.addSubview(blackView)
        
        UIView.animate(withDuration: duration, animations: {
            
            toViewController.view.alpha = 1
//            toViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            //start 'add view' code
            self.imageView.frame = photoViewController.imageView.frame
            //stop 'add view' code

            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.6)
            
        }) { (finished: Bool) -> Void in
            
            //start 'add view' code
            newsFeedViewController.selectedImageView.isHidden = false
            photoViewController.imageView.isHidden = false
            self.imageView.removeFromSuperview()
            //stop 'add view' code
            
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //start 'add view' code
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        newsFeedViewController.selectedImageView.isHidden = true
        photoViewController.imageView.isHidden = true
        
        imageView = UIImageView()
        imageView.image = photoViewController.imageView.image
        let frame = containerView.convert(photoViewController.imageView.frame, from: photoViewController.imageView.superview)
        imageView.frame = frame
        imageView.contentMode = photoViewController.imageView.contentMode
        imageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        
        containerView.addSubview(imageView)
        //stop 'add view' code
        
        
        
        fromViewController.view.alpha = 1
//        fromViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)

        UIView.animate(withDuration: duration, animations: {
            
            fromViewController.view.alpha = 0
//            fromViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
            //start 'add view' code
            self.imageView.frame = newsFeedViewController.selectedImageView.frame
            //stop 'add view' code
            
            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0)
            self.blackView.removeFromSuperview()
            
        }) { (finished: Bool) -> Void in
            
            //start 'add view' code
            newsFeedViewController.selectedImageView.isHidden = false
            photoViewController.imageView.isHidden = false
            self.imageView.removeFromSuperview()
            //stop 'add view' code
            
            self.finish()
        }
    }
    
}
