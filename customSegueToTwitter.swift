//
//  customSegueToTwitter.swift
//  SHS2016
//
//  Created by Brian Ishii on 8/25/16.
//  Copyright © 2016 Brian Ishii. All rights reserved.
//

import UIKit

class customSegueToTwitter: UIStoryboardSegue {
    override func perform()
    {
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            
            destinationVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }) { (finished) -> Void in
            
            destinationVC.view.removeFromSuperview()
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.001 * Double(NSEC_PER_SEC)))
            
            dispatch_after(time, dispatch_get_main_queue()) {
                
                sourceVC.presentViewController(destinationVC, animated: false, completion: nil)
                
            }
        }
    }
}
