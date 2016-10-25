//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var wedding1Image: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = feedImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    


    @IBAction func didTapPhoto1(_ sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegue(withIdentifier: "ShowPhoto", sender: nil)
        
    }

    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        print("I'm about to segue")
        
        let photoViewController = segue.destination as! PhotoViewController
        
        photoViewController.image = selectedImageView.image
        
        photoViewController.modalPresentationStyle = .custom
        
        lightboxTransition = LightboxTransition()
        lightboxTransition.duration = 0.5
        photoViewController.transitioningDelegate = lightboxTransition
    
//        fadeTransition = FadeTransition()
//        fadeTransition.duration = 0.5
//        photoViewController.transitioningDelegate = fadeTransition
        
     }
    

}
