//
//  ViewController.swift
//  Initium
//
//  Copyright © 2018 NiteIsAFK. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var Welcome: UIImageView!
    @IBOutlet weak var LPMWarning: UIImageView!
    @IBOutlet weak var Webview1: WKWebView!
    @IBOutlet weak var Webview2: WKWebView!
    @IBOutlet weak var SwitchAcc: UIButton!
    @IBOutlet weak var HideWelcome: UIButton!
    @IBOutlet weak var ConnectionWarning: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // On first launch preform actions below
        if(!UserDefaults.standard.bool (forKey: "onfirstlaunch"))
        {
            // Unhide Initium intro
            Welcome.isHidden = false
            HideWelcome.isHidden = false
            
            // Save
            UserDefaults.standard.set (true, forKey: "onfirstlaunch")
            UserDefaults.standard.synchronize();
        }
        
        // Check the client for any issues
        
        // Check if connected to the internet
        if !Reachability.isConnectedToNetwork() { ConnectionWarning.isHidden = false }
        
        // Determine if LPM is enabled, if so, display warning
        if ProcessInfo.processInfo.isLowPowerModeEnabled { LPMWarning.isHidden = false }
        
        // Load Initium Google login on Webview 1
        let InitiumGoogURL = URL(string: "https://www.playinitium.com/ServletUserControl?type=oauth&authType=google")
        let InitiumGoogReq = URLRequest(url: InitiumGoogURL!)
        Webview1.load(InitiumGoogReq)
        
        // Load Initium login on Webview 2
        let InitiumURL = URL(string: "https://www.playinitium.com/")
        let InitiumReq = URLRequest(url: InitiumURL!)
        Webview2.load(InitiumReq)
    }
    
    // Disable status bar
    override var prefersStatusBarHidden: Bool { return true }

    // Switch Webviews
    @IBAction func SwitchAcc(_ sender: Any)
    {
        if (!Webview1.isHidden)
        {
            Webview1.isHidden = true
            Webview2.isHidden = false
        }
            // Switch to Webview 1
        else if (!Webview2.isHidden)
        {
            Webview2.isHidden = true
            Webview1.isHidden = false
        }
    }
    
    // Hide welcome
    @IBAction func HideWelcome(_ sender: Any)
    {
        Welcome.isHidden = true
        HideWelcome.isHidden = true
    }
}
