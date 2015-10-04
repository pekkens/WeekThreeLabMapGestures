//
//  ViewController.swift
//  WeekThreeLabMapGestures
//
//  Created by Prisca Ekkens on 10/4/15.
//  Copyright © 2015 Prisca Ekkens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pinTapGesture: UITapGestureRecognizer!
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet var pinPanGesture: UIPanGestureRecognizer!
    @IBOutlet var mapPinchGesture: UIPinchGestureRecognizer!
    @IBOutlet weak var mapImageView: UIImageView!
    
    var pinImageViewInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pinOnTap(sender: UITapGestureRecognizer) {
        print("you're it")
    }
    
    
    @IBAction func onPinPan(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            pinImageViewInitialCenter = pinImageView.center
            
            NSLog("pan Begins \(location)")
            
            UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                self.pinImageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
                }, completion: nil)
            
        } else if sender.state == UIGestureRecognizerState.Changed{
            
            NSLog("panning \(location)")
            
            pinImageView.center = (CGPoint(x: pinImageViewInitialCenter.x + translation.x, y: pinImageViewInitialCenter.y + translation.y))
            
        } else if sender.state == UIGestureRecognizerState.Ended{
            
            NSLog("pan Ends \(location)")
            NSLog("translation \(translation)")
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.pinImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        }
    }
    
    @IBAction func onMapPinch(sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        print("Scale: \(scale)")
        mapImageView.transform = CGAffineTransformMakeScale(scale, scale)
        
        
    }
}

