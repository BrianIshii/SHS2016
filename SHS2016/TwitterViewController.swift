//
//  TwitterViewController.swift
//  SHS2016
//
//  Created by Brian Ishii on 8/25/16.
//  Copyright © 2016 Brian Ishii. All rights reserved.
//

//
//  ScheduleViewController.swift
//  CowboyPower
//
//  Created by Brian Ishii on 8/22/16.
//  Copyright © 2016 Brian Ishii. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    @IBOutlet weak var exitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "cowboyPower2016", APIClient: client)
        //self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#cowboyPower", APIClient: client)
        TWTRTweetView.appearance().primaryTextColor = UIColor.yellowColor()
        TWTRTweetView.appearance().backgroundColor = UIColor.purpleColor()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false; //do not show keyboard nor cursor
    }
    
    @IBAction func exitButtonIsPressed(sender: AnyObject) {
        performSegueWithIdentifier("twitterViewControllerToViewController", sender: self)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
