//
//  HamburgerViewController.swift
//  CodePathYouTube
//
//  Created by Jonlin Pei on 3/2/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var feedView: UIView!
    
    var menuViewController: MenuViewController!
    var feedViewController: FeedViewController!
    var feedViewCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("feedViewController") as FeedViewController
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("menuViewController") as MenuViewController
        
        menuView.addSubview(menuViewController.view)
        feedView.addSubview(feedViewController.view)
        
        feedViewCenter = feedView.center

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanFeed(sender: AnyObject) {
        
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        
        if (sender.state == UIGestureRecognizerState.Began){
            println("Pan started")
            
        } else if (sender.state == UIGestureRecognizerState.Changed){
            
            feedView.center.x = feedViewCenter.x + translation.x
            
            println("Pan changed")
        } else if (sender.state == UIGestureRecognizerState.Ended){
            
            UIView.animateWithDuration(0.4, animations:  { () -> Void in
                if (velocity.x > 0) {
                    self.feedView.center.x = 430
                    
                } else {
                    self.feedView.center.x = 160
                }
            })
            
            feedViewCenter = feedView.center
            println("Pan ended")
        }
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
