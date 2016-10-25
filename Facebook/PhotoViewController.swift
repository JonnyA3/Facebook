//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Abowd, Jonathan on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionsBar: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 569)
        
        scrollView.delegate = self

        imageView.image = image
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDone(_ sender: UIButton) {
        self.doneButton.isHidden = true
        self.actionsBar.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0)
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.doneButton.isHidden = true
        self.actionsBar.isHidden = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        let yScroll = scrollView.contentOffset.y
        
        print("\(yScroll)")
        
        if yScroll < -100 {
            dismiss(animated: true, completion: nil)
        } else {
            self.doneButton.isHidden = false
            self.actionsBar.isHidden = false
        }
        

    }

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
