//
//  ViewController.swift
//  SHS2016
//
//  Created by Brian Ishii on 8/25/16.
//  Copyright © 2016 Brian Ishii. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox

class ViewController: UIViewController {
    let manager = CMMotionManager()
    var b = 0
    var soundURL: NSURL?
    var soundID:SystemSoundID = 0

    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var purpleCowboyImage: UIImageView!
    @IBOutlet weak var yellowCowboyImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        let filePath = NSBundle.mainBundle().pathForResource("cowbell_tip (1)", ofType: "wav")
        soundURL = NSURL(fileURLWithPath: filePath!)
        AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        manager.accelerometerUpdateInterval = 0.1
    }
    @IBAction func twitterButtonIsPressed(sender: AnyObject) {
        manager.stopAccelerometerUpdates()
        performSegueWithIdentifier("viewControllerToTwitterViewController", sender: self)
    }
    override func viewDidAppear(animated: Bool) {
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!){
            [unowned self] data, error in
            if ((data?.acceleration.x)! > 0){
                if self.b != 1{
                    self.view.backgroundColor = UIColor.purpleColor()
                    self.yellowCowboyImage.hidden = false
                    self.purpleCowboyImage.hidden = true
                    self.playSounds()
                    self.b = 1
                }
            }
            else if ((data?.acceleration.x)! < 0)  {
                if self.b != 2{
                    self.view.backgroundColor = UIColor.yellowColor()
                    self.yellowCowboyImage.hidden = true
                    self.purpleCowboyImage.hidden = false
                    self.playSounds()
                    self.b = 2
                }
            }
            else{
                self.view.backgroundColor = UIColor.yellowColor()
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func playSounds() {
        AudioServicesPlaySystemSound(self.soundID)
        //add score
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewControllerToTwitterViewController"{
        let DestViewController : TwitterViewController = segue.destinationViewController as! TwitterViewController
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

