//
//  ViewController.swift
//  WeekThreeLabMapGestures
//
//  Created by Prisca Ekkens on 10/4/15.
//  Copyright © 2015 Prisca Ekkens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet var pinPanGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onPInPan(sender: AnyObject) {
        let location = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            NSLog("pan Begins \(location)")
            UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                self.pinImageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
                }, completion: nil)
            
        } else if sender.state == UIGestureRecognizerState.Changed{
            NSLog("panning \(location)")
            self.pinImageView.center = location
            
        } else if sender.state == UIGestureRecognizerState.Ended{
            NSLog("pan Ends \(location)")
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.pinImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
        }
    }
}

