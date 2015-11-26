//
//  GameViewController.swift
//  SpriteKit-iAd-Banner
//
//  Created by mstcode on 26/11/15.
//  Copyright (c) 2015 mstcode. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate {

    var adBanner: ADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
        loadBanner()
    }

    func loadBanner() {
        adBanner = ADBannerView(frame: CGRect.zero)
        adBanner.center = CGPoint(x: adBanner.center.x, y: view.bounds.size.height - adBanner.frame.size.height / 2)
        adBanner.delegate = self
        adBanner.hidden = true
        view.addSubview(adBanner)
    }
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        adBanner.hidden = false
    }
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        adBanner.hidden = false
    }
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
